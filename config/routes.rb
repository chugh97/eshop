Eshop::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'products#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  post 'carts/add' => 'carts#add'
  post 'carts/update' => 'carts#update'
  post 'carts/deletelineitem' => 'carts#deletelineitem'

  get 'newuser' => 'user#new'
  post 'user/create' => 'user#create'
  get 'user/registration' => 'user#registration'
  post 'user/address' => 'user#address'
  get "/auth/paypal/callback", to: "callback#show"

  resources :invitation do
    member do
      get :confirm
    end
  end



  #resources :orders, :new => { :express => :get }
  get 'orders/express', to: 'orders#express'
  get 'orders/new', to: 'orders#new'

  resources :carts do
    resources :products
  end

  resources :products

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
