Rails.application.routes.draw do
  resources :products
  root "static_pages#home"
  get "products/new", to: "products#new"
end
