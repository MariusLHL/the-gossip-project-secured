Rails.application.routes.draw do
  resources :gossips do 
    resources :comments
    resources :like, only:[:create, :destroy]
  end
  resources :user
  resources :city
  resources :sessions_controller
  root to: 'gossips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
