class SheetsController < ApplicationController
  
  def index
    
    # If we're already authenticated, head over to the user's sheet
    if cookies[:access_token] or params[:code]
      redirect_to '/sheet'
    end
    
  end
  
  def show
    
    # Instagram's authentication callback url
    @callback = "http://#{request.host_with_port}/sheet"
    
    # Handle the callback, store the access_token
    if params[:code] and !cookies[:access_token]
      response = Instagram.get_access_token(params[:code], :redirect_uri => @callback)
      cookies[:access_token] = {
        :value => response.access_token,
        :expires => 1.year.from_now
      }
    end
    
    # If we're authenticated, display contact sheet
    if cookies[:access_token]
      client = Instagram.client(:access_token => cookies[:access_token])
      @user = client.user
      @photos = client.user_media_liked
      
    # Otherwise, head over to Instagram to get an access_token
    elsif !cookies[:access_token]
      redirect_to Instagram.authorize_url(:redirect_uri => @callback)
      return
      
    # All else fails...
    else 
      redirect_to root_path
    end
    
  end
  
  def logout
    # redirect_to https://instagram.com/accounts/logout/
    cookies.delete :access_token
    redirect_to root_path
  end

end
