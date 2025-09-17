Rails.application.routes.draw do
  root "products#index"

  resources :products
  resources :sales
  resources :sale_items

  resource :session
  resources :passwords, param: :token
end
