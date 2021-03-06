Rails.application.routes.draw do
  root 'movies#index'
  resources :users

  resources :movies, except: [:destroy, :edit]

  resources :pops, only: [:create, :patch]

  resources :reviews, except: :index

  resources :comments, except: :index

  resources :movies do
    resources :comments
  end

  resources :reviews do
    resources :comments
  end

  # resources :reviews do
  #   resources :pops, only: [:create, :update]
  # end

  post '/reviews/:review_id/pops/:type', to: 'pops#create', as: 'kernz'
  patch '/reviews/:review_id/pops/:id/:type', to: 'pops#update', as: 'update_kern'


  resources :classifications, only: [:show, :index]

  get '/login', to: 'users#login', as: 'login_page'
  post '/login', to: 'users#new_session', as: 'login'
  delete '/logout', to: 'users#logout', as: 'logout'

  get '/results', to: 'results#index'

  # custom error pages
  get '/401', to: 'errors#unauthorized'

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
