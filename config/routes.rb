Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :key_resources

  root to: redirect('key_resources')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
