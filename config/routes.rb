Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  # get 'user', to: 'users#studentportal'
  get 'teacher', to: 'faculties#index'
  get 'management', to: 'welcome#adminportal'

  resources :users #, only: [:show, :new, :create, :edit, :update]

  resources :students

  resources :students do
    member do
      get :confirm_email
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :faculties
end
