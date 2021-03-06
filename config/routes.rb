Roydon::Application.routes.draw do
  resources :addresses, except: [:index]

  devise_for :users, controllers: {confirmations: 'confirmations'}

  devise_scope :user do
    patch "/confirm" => "confirmations#confirm"
  end
  resources :users, only: [:show], constraints: { id: BSON_ID_REGEX }

  mount RailsAdmin::Engine, at: '/admin', as: 'rails_admin'

  resources :stories, only: [:index], path: :news, constraints: { id: BSON_ID_REGEX }

  namespace :shop do
    resources :products, only: [:index, :show], constraints: { id: BSON_ID_REGEX } do
      collection do
        get 'categories/:category', action: :index, as: 'category', constraints: { category: /[a-zA-Z0-9~-]+/i }
      end
    end
    resources :shopping_carts, except: [:index], constraints: { id: BSON_ID_REGEX } do
      delete '/remove_item/:id', action: 'remove_item', as: 'remove_item'
      match '/add_item/:id', action: 'add_item', as: 'add_item', via: [:get, :post]
    end
    get '/' => 'shop#index'
    get 'search' => 'shop#search'
    resources :orders, except: [:index]
  end

  resources :shows, only: [], constraints: { year: /\d{4}/ } do
    collection do
      get '(:year)', action: 'index', as: ''
    end
  end

  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
  get '/' => 'pages#home', as: 'home'

  get "/404" => 'errors#not_found'
  get "/500" => 'errors#server_error'
  get "/:status" => 'errors#error', constraints: { status: /[45][0-9][0-9]/}

  root to: 'pages#home'
end
