Rails.application.routes.draw do

  # resources :transactions

  resources :transactions do
    collection do
      get :view_all
    end
    get :get_details, :on=>:member
    get :to_print_pdf, :on=>:member
  end

  resources :accounts do
    collection do
      get :pdf_export
    end
  end

  resources :dashboard

#  get 'dashboard/index'

  resources :users
  resources :user_sessions

  match 'login', :to => 'user_sessions#new', :via => [:get]
  match 'logout', :to => 'user_sessions#destroy', :via => [:get]

  # controller :user_sessions do
  #
  #   get 'login' => :new
  #   post 'login' => :create
  #   delete 'logout' => :destroy
  # end
  # match 'login' => 'user_sessions#new',      :as => :login
  # match 'logout' => 'user_sessions#destroy', :as => :logout
  #
  # match ':controller(/:action(/:id(.:format)))'

  resources :roles do
    get :approve, :on=>:member
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user_sessions#new'

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
