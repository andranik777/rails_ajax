Rails.application.routes.draw do
  root "books#index"
resources :books, only: [:create,:index] 
resources :emails, only: [:create, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
