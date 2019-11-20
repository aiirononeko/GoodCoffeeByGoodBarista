Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    shared: 'shared/error_messages'
  }
  resources :users, only: [:index, :show]
end
