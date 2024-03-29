Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts do
    resources :comments
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
