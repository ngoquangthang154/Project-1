Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "show_product#show"
  get "sessions/new"
  get "session/new"

  resources :users
  get "/signup", to: "users#new"
  get "/showu", to: "users#show", as: "showu"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :products
  get "show", to: "show_product#show", as: "showp"
  get "show/:id", to: "show_product#detail", as: "detailp"
  get "cart/", to: "show_product#cart", as: "listcart"
  post "cart/", to: "show_product#destroy", as: "destroycart"

  get "news", to: "show_news#show", as: "news"
  get "news/:id", to: "show_news#detail", as: "newd"

  root "show_product#show"
end
