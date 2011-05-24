class ApplicationController < ActionController::Base
  protect_from_forgery
  
  Instagram.configure do |config|
    config.client_id = "da0cd26bea6f4ad4abf7f3b89777e687"
    config.client_secret = "4e1157797bba4ce3af1350e5b3be7f86"
  end
  
end
