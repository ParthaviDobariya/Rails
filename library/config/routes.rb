Rails.application.routes.draw do
  devise_for :librarians
  devise_scope :librarian do
    root to: "devise/sessions#new"
  end
  resources :book_issues
  resources :books
  resources :publications
  resources :categories
  resources :authors
  resources :librarians
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
