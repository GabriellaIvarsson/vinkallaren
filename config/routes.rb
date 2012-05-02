Vinkallaren::Application.routes.draw do
  get "profile/index"

  get "menu/index"

  get "home/start"

  get "sessions/new"

  get "sessions/create"

  get "sessions/failure"

  get "login/index"

  resources :home
  root :to => "sessions#new"

  #resources :home
  get   '/home', :to => 'home#index', :as => :home
  get   '/menu', :to => 'menu#index', :as => :menu
  get   '/profile', :to => 'profile#index', :as => :profile

  # Create a simple login form where the user will see a simple “Connect with Facebook” link.
  get   '/login', :to => 'sessions#new', :as => :login

  # Catch the provider’s callback. After a user authorizes your app, the provider redirects the user to this url, so we can make use of their data.
  match '/auth/:provider/callback', :to => 'sessions#create'

  # Will be used when there’s a problem, or if the user didn’t authorize our application.
  match '/auth/failure', :to => 'sessions#failure'

  # Create the app route for logging out.
  get '/logout', :to => 'sessions#destroy', :as => :logout

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  #resources :login
  #root :to => "login#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
