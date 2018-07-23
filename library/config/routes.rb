Rails.application.routes.draw do
  devise_for :librarians
  resources :book_issues
  resources :books
  resources :publications
  resources :categories
  resources :authors
  resources :librarians
  resources :users
  root 'librarians#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
