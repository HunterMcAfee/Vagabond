Rails.application.routes.draw do
  devise_for :users
  root to: 'cities#index'
  resources :cities do
    resources :posts
  end
  
end
