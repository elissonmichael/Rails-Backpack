Rails.application.routes.draw do
  resources :backpacks do
    resources :slots, except: :index
  end
  resources :items
  root 'backpacks#index'
end
