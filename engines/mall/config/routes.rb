Mall::Engine.routes.draw do

  devise_for :users, controllers: {confirmations: 'confirmations'}

  devise_scope :user do
    patch "/confirm" => "confirmations#confirm"
  end

  resources :users, only: [:show], constraints: { id: BSON_ID_REGEX }

  resources :addresses, except: [:index]

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
