Rails.application.routes.draw do
  get "show", to: "show_product#show", as: "showp"
  get "show/:id", to: "show_product#detail", as: "detailp"
  post "show/:id", to: "show_product#detail", as: "reply"
  get "cart/", to: "show_product#cart", as: "listcart"
  post "cart/", to: "show_product#destroy", as: "destroycart"
  post "postcomment/", to: "show_product#postcomment", as: "postcmt"

  root "show_product#show"
end
