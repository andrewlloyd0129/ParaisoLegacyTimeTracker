Rails.application.routes.draw do
  root to: 'jobs#index'

  resources :jobs do
    member do
      get :toggle_status
    end
  end
end
