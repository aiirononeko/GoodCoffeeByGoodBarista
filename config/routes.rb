Rails.application.routes.draw do
  root to: 'tops#barista'
  get 'tops/owner', to: 'tops#owner'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    shared: 'shared/error_messages'
  }
  resources :users, only: [:index, :show]

  resources :owners

  get 'login', to: 'owner_sessions#new'
  post 'login', to: 'owner_sessions#create'
  delete 'logout', to: 'owner_sessions#destroy'
end
