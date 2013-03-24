Roydon::Application.routes.draw do

  bson_id_regex = /[0-9a-f]{24}/i

  resources :addresses, except: [:index]

  devise_for :users, controllers: {confirmations: 'confirmations'}

  devise_scope :user do
    put "/confirm" => "confirmations#confirm"
  end
  resources :users, only: [:show], constraints: { id: bson_id_regex }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :stories, only: [:index], path: :news, constraints: { id: bson_id_regex }

  namespace :shop do
    resources :products, only: [:index, :show], constraints: { id: bson_id_regex } do
      collection do
        get 'categories/:category', action: :index, as: 'category', constraints: { category: /[a-zA-Z0-9~-]+/i }
      end
    end
    resources :shopping_carts, except: [:index], constraints: { id: bson_id_regex } do
      delete '/remove_item/:id', action: 'remove_item', as: 'remove_item'
      post '/add_item/:id', action: 'add_item', as: 'add_item'
    end
    get '/', to: 'shop#index'
    get 'search', to: 'shop#search'
    resources :orders, except: [:index]
  end

  resources :shows, only: [], constraints: { year: /\d{4}/ } do
    collection do
      get '(:year)', action: 'index', as: ''
    end
  end

  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/', to: 'pages#home', as: 'home'

  root to: 'pages#home'

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
