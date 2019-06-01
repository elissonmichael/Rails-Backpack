Rails.application.routes.draw do
  resources :backpacks do
    get 'new_item_form', on: :member
    post 'add_item',     on: :member
  end
  resources :items
  root 'backpacks#index'
end
