Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'user', to: 'welcome#studentportal'
  get 'management', to: 'welcome#adminportal'
  get 'teacher', to: 'welcome#facultyportal'
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

  resources :faculties
end
