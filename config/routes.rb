Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'user', to: 'welcome#studentportal'
  get 'teacher', to: 'faculties#index'
  get 'management', to: 'welcome#adminportal'
  resources :students

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
<<<<<<< HEAD
end
=======

  resources :faculties
end
>>>>>>> 26bfa0dc59fc9eb9f9a3bb8db70de8d571e2c8f0
