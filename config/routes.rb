Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boards

  resources :posts, only: [:create, :show, :destroy] do
    resources :comments, only: [:create]
  end

end
