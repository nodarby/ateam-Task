Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boards

  post 'posts/create' => 'posts#create', as: :post_create
end
