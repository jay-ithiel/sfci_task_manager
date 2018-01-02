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
#
# Rails.application.routes.draw do
#   root to: "static_pages#root"
#
#   namespace :api, defaults: { format: :json } do
#     resources :users, only: [:create, :home]
#     resource :session, only: [:create, :destroy]
#     resources :spots, only: [:create, :update, :show, :index, :destroy]
#     resources :bookings, only: [:create, :index, :show, :destroy] do
#       patch 'approve'
#       patch 'deny'
#     end
#     resources :reviews
#   end
# end
