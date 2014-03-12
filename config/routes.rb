Roydon::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine, at: '/admin', as: 'rails_admin'

  resources :stories, only: [:index], path: :news, constraints: { id: BSON_ID_REGEX }

  mount Mall::Engine, at: '/shop', as: 'shop'

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
