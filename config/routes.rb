Rails.application.routes.draw do
  devise_for :admins
  devise_for :publics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# public側のルーティング
scope module: :public do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :products, only: [:index, :show]
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]

  post 'order/confirm' => 'orders#confirm'
  get '/orders' => 'orders#complete'

  resources :orders, only: [:index, :show, :new, :create]

  resources :carts, only: [:index, :create, :update]
   delete 'carts/destroy_all' => 'carts#destroy_all'
   delete 'carts/destroy' => 'carts#destroy', as: 'destroy_cart'

  put 'my_page' => 'customers#update', as: 'customer'
  get 'my_page/edit' => 'customers#edit', as: 'edit_customer'
  get 'customers/my_page' => 'customers#show', as: 'customer_show'
  get 'customers/quit_confirm' => 'customers#quit_confirm', as: 'quit_confirm'
  patch 'customers/quit' => 'customers#quit', as: 'quit'
end

end
