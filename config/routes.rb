Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :jobs
    resources :jobs_csvs
    resources :tasks
    resources :task_entries
    resources :time_entries

    root to: "users#index"
  end

  resources :jobs_csvs
  resources :task_entries
  resources :time_entries

  get 'clock_out/:id', to: 'time_entries#clock_out', as: :clock_out
  put 'clock_out_update/:id', to: 'time_entries#clock_out_update', as: :clock_out_update
  get 'switch_task/:id', to: 'time_entries#switch_task', as: :switch_task
  put 'switch_task_update/:id', to: 'time_entries#switch_task_update', as: :switch_task_update

  get 'pages/admin_dashboard'

  get 'pages/user_dashboard'

  get 'pages/archive'

  root to: 'time_entries#index'

  devise_for :users, skip: [:registrations]
  
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
