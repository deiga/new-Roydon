Roydon::Application.routes.draw do
  resources :addresses, except: [:index]

  devise_for :users, controllers: {confirmations: 'confirmations'}

  devise_scope :user do
    put "/confirm" => "confirmations#confirm"
  end
  resources :users, only: [:show], constraints: { id: BSON_ID_REGEX }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :stories, only: [:index], path: :news, constraints: { id: BSON_ID_REGEX }

  namespace :shop do
    resources :products, only: [:index, :show], constraints: { id: BSON_ID_REGEX } do
      collection do
        get 'categories/:category', action: :index, as: 'category', constraints: { category: /[a-zA-Z0-9~-]+/i }
      end
    end
    resources :shopping_carts, except: [:index], constraints: { id: BSON_ID_REGEX } do
      delete '/remove_item/:id', action: 'remove_item', as: 'remove_item'
      post '/add_item/:id', action: 'add_item', as: 'add_item'
      get '/add_item/:id', action: 'add_item', as: 'add_item'
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

  root to: 'pages#home'

  match "/404" => 'errors#not_found'
  match "/500" => 'errors#server_error'
  match "/:status" => 'errors#error', constraints: { status: /[45][0-9][0-9]/}

end
