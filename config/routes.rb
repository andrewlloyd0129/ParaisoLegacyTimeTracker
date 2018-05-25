Rails.application.routes.draw do

  resources :task_entries
  resources :time_entries
  get 'pages/admin_dashboard'

  get 'pages/user_dashboard'

  get 'pages/archive'

  root to: 'jobs#index'
  devise_for :users
  
  resources :jobs do
    member do
      get :toggle_status
    end
  end

  resources :tasks do
    member do
      get :toggle_status
    end
  end

  
end
