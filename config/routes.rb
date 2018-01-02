Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :employees, only: [:create, :update, :show, :index, :destroy]
    resource :session, only: [:create, :destroy]
    resources :departments, only [:create, :update, :show, :index, :destroy]
    resources :tasks, only [:create, :update, :show, :index, :destroy]
    resources :sub_tasks, only [:create, :update, :show, :index, :destroy]
  end
end
