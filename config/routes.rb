Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'

  resources :users, only: [:edit,:show,:update,:destroy] do
    resources :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :photos , only: [:index,:new,:create,:show,:edit,:update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :photo_comments, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
