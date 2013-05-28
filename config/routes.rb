Moysky::Application.routes.draw do
  resources :theaders

  namespace :userspace do
    resources :users ,:except =>[:show] do

      collection do
        get :forget_password
        post :forget_password
        get "find_password/:key/:email",:action => :find_password_page,:email =>  /[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)/          # the web page for find_password
        post :find_password            # handle the request
        post 'logon'
        post 'logout'
        post 'follow'                   #follow
        delete 'unfollow'           #unfollow
      end

    end

  end

  get "comments/new"
  delete "comments/destroy"
  post "comments/create",:as => 'comments'
  resources :weibos,:except =>[:show,:edit] do
    member do
      get :userspace
    end
  end

  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root to: 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  root :to=> 'weibos#index'
end
