Roydon::Application.routes.draw do

  resources :stories, :only => [:index], :path => :news

  namespace :shop do
    resources :products, :only => [:index, :show]
    match '/', :to => 'shop#index'
    match '/:top_category(/:category)', :to => 'shop#index'
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  match "/shows(/:year)", :to => 'shows#index',
    :constraints => { :year => /(\d\d\d\d)/ },
    :as => 'shows',
    :defaults => {:year => 2012}

  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'

  root :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

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

  # See how all your routes lay out with "rake routes"

end
