Rails.application.routes.draw do
  get "show", to: "show_product#show", as: "showp"
  get "show/:id", to: "show_product#detail", as: "detailp"
  get "cart/", to: "show_product#cart", as: "listcart"
  post "cart/", to: "show_product#destroy", as: "destroycart"

  root "show_product#show"
end
