Rails.application.routes.draw do

  resources :task_entries
  resources :time_entries

  get 'clock_out/:id', to: 'time_entries#clock_out', as: :clock_out
  put 'clock_out_update/:id', to: 'time_entries#clock_out_update', as: :clock_out_update

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
