Instasheet::Application.routes.draw do
  resources :sheets
  root :to => 'sheets#index'
  match "/sheet" => "sheets#show"
  match "/logout" => "sheets#logout"
end
