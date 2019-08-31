Rails.application.routes.draw do

  # get 'tweets/index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' } # ここを変更
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#index'

  resources :maps
  resources :blogs
  resources :users, only: [:show]

  # 管理画面のルーティング
  namespace :admin do
    resources :users
  end
end
