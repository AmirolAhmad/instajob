Instajob::Application.routes.draw do
  get "post/index"
  devise_for :members,
    :controllers => {
      :registrations => "registrations"
    },
    :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :password => 'secret',
      :confirmation => 'verification',
      registration: 'register'
    }

  devise_scope :member do
    get '/logout' => 'devise/sessions#destroy'
    get '/login', :to => 'devise/sessions#new'
    get '/register', :to => 'devise/registrations#new'
    get '/forgot_password', :to => 'devise/passwords#new'
    get '/settings/profile', :to => 'devise/registrations#edit'
  end

  get "welcome/index"

  resources :user, only: [:show] do
    collection do
      patch 'update_password'
    end
  end
  match "profile", to: "user#show", :via => 'get'
  match "settings", to: "user#edit", :via => 'get'
  match "settings/credential", to: "user#credential", :via => 'get'
  match "settings/company", to: "user#company", :via => 'get'
  match "settings/skill", to: "user#skill", :via => 'get'
  match "terms", to: "welcome#terms", :via => 'get'
  match "post", to: "post#index", :via => 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
