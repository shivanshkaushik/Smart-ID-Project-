Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'

  # get 'user', to: 'welcome#studentportal'
  get 'management', to: 'welcome#adminportal'
  get 'teacher', to: 'welcome#facultyportal'
  # get 'user', to: 'students#index'

  # get 'user', to: 'users#studentportal'
  # get 'teacher', to: 'faculties#index'
  # get 'management', to: 'welcome#adminportal'

  resources :users


  resources :students

  resources :students do
    member do
      get :confirm_email
    end
  end

  get 'student_login', to: 'student_sessions#new'
  post 'student_login', to: 'student_sessions#create'
  delete 'student_logout', to: 'student_sessions#destroy'

  get 'faculty_login', to: 'faculty_sessions#new'
  post 'faculty_login', to: 'faculty_sessions#create'
  delete 'faculty_logout', to: 'faculty_sessions#destroy'

  get 'admin_login', to: 'admin_sessions#new'
  post 'admin_login', to: 'admin_sessions#create'
  delete 'admin_logout', to: 'admin_sessions#destroy'

  resources :faculties

  get 'request_confirmation', to: 'requests#show'
  get 'requests', to: 'requests#index'
end
