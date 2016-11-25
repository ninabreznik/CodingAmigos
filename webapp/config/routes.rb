Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

  resources :users
    # match '/users/:id/edit',          to: 'users#edit',       via: 'edit'
    match '/users/:id',               to: 'users#show',       via: 'get'
    match '/users',                   to: 'users#index',      via: 'get'

  resources :projects
    match '/projects/:id',            to: 'projects#show',     via: 'get'
    match '/projects',                to: 'projects#index',    via: 'get'
    match '/projects',                to: 'projects#new',      via: 'get'
    match '/projects/:id',            to: 'projects#update',   via: 'edit'


  resources :leads
    match '/find_professional',                   to: 'leads#new',      via: 'get'

  resources :paypal_notifications, only: [:create]
    match '/paypal_notification',       to: 'paypal_notifications#create',        via: 'post'

  resources :orders
    get '/messages' => 'conversations#index'
    # get '/bank_transaction' => 'orders#bank_transaction'
    # get '/wallet_payment_from_lead' => 'orders#wallet_payment_from_lead'
    # get '/address_book' => 'orders#address_book'
    # match '/orders/:id',       to: 'orders#show',          via: 'get'
    # match '/orders/:id',       to: 'orders#delete',        via: 'delete'

  resources :likes
    match '/likes/new',       to: 'likes#create',        via: 'post'


  # You can have the root of your site routed with "root"
  root 'users#index'

  #post 'paypal_confirm'  => 'orders#paypal_payment_notification'  #'paypal_confirm' is a callback I provide to Paypal and it triggers 'orders#paypal_confirm'

  get 'leads/index'
  get 'leads/show'
  get 'leads/new'
  get 'leads/edit'


  get '/about' => 'static_pages#about'
  get '/info' => 'static_pages#info'
  get '/terms' => 'static_pages#terms'
  get '/pricing' => 'static_pages#pricing'
  get '/privacy' => 'static_pages#privacy'
  get '/contact' => 'static_pages#contact'
  get '/dashboard' => 'static_pages#dashboard'
  get '/chat' => 'static_pages#chat'
  # get '/payment_type' => 'static_pages#payment'
  # get '/payment_confirmation' => 'static_pages#payment_confirmation'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # match '/signup',       to: 'users#new',            via: 'get'
  # match '/signin',       to: 'sessions#new',         via: 'get'
  # match '/signout',      to: 'sessions#destroy',     via: 'delete'
  #match '/orders',       to: 'orders#create',        via: 'post'


  # get '/wallet_payment_type' => 'static_pages#wallet_payment_type'
  # get '/wallet_payment' => 'static_pages#wallet_payment'

  # get '/plans' => 'static_pages#plans'
  # get '/plans_1' => 'static_pages#plans_1'
  # get '/plans_2' => 'static_pages#plans_2'
  # get '/plans_3' => 'static_pages#plans_3'


  # Example of regular route:
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):


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
