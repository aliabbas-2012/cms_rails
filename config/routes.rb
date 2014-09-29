Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  #resources :test_boot_straps

  resources :posts
  resources :pages
  resources :subjects
  #resources :demo
  resources "test-boot-strap", :as => :test_boot_straps, :controller => :test_boot_straps

  root 'demo#index'
  get 'demo/login' => 'demo#login'
  get 'admin/demo/login' => 'demo#login'

  get 'demo/create-user' => 'demo#create_user'

  get 'demo/create-subjects' => 'demo#create_subjects'
  delete 'demo/logout'=>'demo#logout',:as=>:destroy_session_path
  delete 'admin/demo/logout'=>'demo#logout'

  match ':controller(/:action)' ,:via => [:get, :post]
  match ':controller(/:action(:/id))' ,:via => [:get, :post]




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
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
