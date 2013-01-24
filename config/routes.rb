Roydon::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :stories, :only => [:index], :path => :news, constraints: { id: /[0-9a-f]{24}/i}

  namespace :shop do
    resources :products, :only => [:index, :show], constraints: { id: /[0-9a-f]{24}/i} do
      collection do
        get 'categories/:category', :action => :index, :as => 'category', constraints: { category: /[a-zA-Z0-9~-]+/i }
      end
    end
    resources :shopping_carts, :except => [:index], constraints: { id: /[0-9a-f]{24}/i} do
      get '/remove_item/:id', action: 'remove_item', as: 'remove_item'
      get '/add_item/:id', action: 'add_item', as: 'add_item'
    end
    get '/', :to => 'shop#index'
    resources :orders, :except => [:index]
  end

  resources :shows, except: [:index, :show], constraints: { id: /[0-9a-f]{24}/i, :year => /\d{4}/ } do
    collection do
      get '(:year)', action: 'index', defaults: { year: 2012 }, as: 'year'
    end
  end

  get '/contact', :to => 'pages#contact'
  get '/about', :to => 'pages#about'

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
