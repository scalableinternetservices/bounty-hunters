Rails.application.routes.draw do

  
  get 'tasks/create'
  get 'tasks/map', to: "tasks#map", as: "map_task"
  get 'tasks/new', to: "tasks#new", as: "new_task"
  get 'tasks/index', to: "tasks#index", as: "index_task"
  get 'tasks/show'
  resources :tasks
  
  post 'tasks/:id/claim', to: "tasks#claim", as:"claim_task"
  put 'tasks/:id/cancel', to: "tasks#cancel", as:"cancel_task"
  post 'tasks/:id/complete', to: "tasks#complete", as:"complete_task"
  post 'tasks/:id/destroy', to: "tasks#destroy", as:"destroy_task"
  
  
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'users/sign_in', as: "sign_in"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/mainpage', to: 'pages#mainpage', as: "main_app"

  # You can have the root of your site routed with "root"
  root 'pages#home', as: "landing_page"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'rail
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
