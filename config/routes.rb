Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users
  resources :animals do
    resource :favorites, only: [:create, :destroy]
  end

end
