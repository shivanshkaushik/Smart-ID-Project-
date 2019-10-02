Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'user', to: 'welcome#studentportal'
  get 'teacher', to: 'welcome#facultyportal'
  get 'management', to: 'welcome#adminportal'
  resources :students

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :faculties
end
