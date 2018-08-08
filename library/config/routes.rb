Rails.application.routes.draw do
  
  root "home_pages#index"
  
  devise_for :librarians, skip: [:sessions, :registrations, :passwords]
  as :librarian do
    get    '/login',           to: 'devise/sessions#new',         as: :new_librarian_session
    post   '/login',           to: 'devise/sessions#create',      as: :librarian_session
    delete '/logout',          to: 'devise/sessions#destroy',     as: :destroy_librarian_session

    get    '/register',        to: 'devise/registrations#new',    as: :new_librarian_registration
    post   '/register',        to: 'devise/registrations#create', as: :librarian_registration
    get    '/edit_profile',    to: 'devise/registrations#edit',   as: :edit_librarian_registration
    put    '/register',        to: 'devise/registrations#update', as: :update_librarian_registration
    delete '/register',        to: 'devise/registrations#destroy',as: :destroy_librarian

    get    '/forgot-password', to: 'devise/passwords#new',        as: :new_librarian_password
    post   '/forgot-password', to: 'devise/passwords#create',     as: :librarian_password
    get    '/forgot-password', to: 'devise/passwords#edit',       as: :edit_librarian_password
    put    '/forgot-password', to: 'devise/passwords#update',     as: :update_librarian_password
  end

  resources :home_pages
  resources :librarians
  resources :book_issues
  resources :books
  resources :publications
  resources :categories
  resources :authors
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
