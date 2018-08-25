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
    get    '/edit_password',   to: 'devise/passwords#edit',       as: :edit_librarian_password
    put    '/forgot-password', to: 'devise/passwords#update',     as: :update_librarian_password
  end

  resources :home_pages, path: 'Library'
  get      '/select_author',    to: 'home_pages#select_author'
  get      '/references',       to: 'home_pages#references'
  resources :librarians, path: 'Admin'
  resources :book_issues
  resources :books
  resources :publications
  resources :categories
  resources :authors
  resources :users 
  resources :shops

  match "/404", to: "application#record_not_found", via: :all
  match "/500", to: "application#internal_server_error", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end