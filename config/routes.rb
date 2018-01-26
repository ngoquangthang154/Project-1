Rails.application.routes.draw do
  resources :products

  get "show", to: "show_product#show", as: "showp"
  get "show/:id", to: "show_product#detail", as: "detailp"
  get "cart/", to: "show_product#cart", as: "listcart"
  post "cart/", to: "show_product#destroy", as: "destroycart"
  get "products/new", to: "products#new"

  root "show_product#show"
end
