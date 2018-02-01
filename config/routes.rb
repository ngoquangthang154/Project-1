Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "show_product#show"
  get "session/new"
  get "news", to: "show_news#show", as: "news"
  get "news/:id", to: "show_news#detail", as: "newd"

  resources :users
  get "/users", to: "users#index"
  get "/signup", to: "users#new"
  get "/showu", to: "users#show", as: "showu"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :products
  get "show", to: "show_product#show", as: "showp"
  get "show/:id", to: "show_product#detail", as: "detailp"
  post "show/:id", to: "show_product#detail", as: "reply"
  get "cart/", to: "show_product#cart", as: "listcart"
  post "cart/", to: "show_product#destroy", as: "destroycart"
  post "postcomment/", to: "show_product#postcomment", as: "postcmt"
  post "checkout/", to: "show_product#checkout", as: "checkout"

  namespace :admin do
    resources :products
    get "show", to: "products#show", as: "show"
    get "new", to: "products#new"
    root "products#index"
  end

  namespace :admin do
    resources :products
    get "show", to: "products#show", as: "show"
    get "new", to: "products#new"
    root "products#index"
  end
end
