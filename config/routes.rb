Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    if Rails.env.development?
      get '/users/development/sign_in_developer', to: 'users/development#sign_in_developer'
      get '/users/development/output_current_user', to: 'users/development#output_current_user'
    end
  end

  resources :key_resources

  root to: redirect('key_resources')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
