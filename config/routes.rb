Roydon::Application.routes.draw do

  resources :stories, :only => [:index], :path => :news, constraints: { id: /[0-9a-f]{24}/i}

  namespace :shop do
    resources :products, :only => [:index, :show], constraints: { id: /[0-9a-f]{24}/i} do
      collection do
        get ':category', :action => :index, :as => 'category', constraints: { category: /[a-zA-Z-]+/i }
      end
    end
    resources :shopping_carts, :except => [:index], constraints: { id: /[0-9a-f]{24}/i}
    match '/add_to_cart/:product', to: 'shop#add_to_cart', as: 'add_to_cart'
    match '/', :to => 'shop#index'
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  resources :shows, except: [:index, :show], constraints: { id: /[0-9a-f]{24}/i, :year => /\d{4}/ } do
    collection do
      get '(:year)', action: 'index', defaults: { year: 2012 }, as: 'year'
    end
  end

  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'

  root :to => 'pages#home'

  #Last route in routes.rb
  match '*a', :to => 'errors#routing'

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
