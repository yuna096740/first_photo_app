Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'

  resources :users, only: [:edit,:show,:update,:destroy]
  resources :photos , only: [:index,:new,:create,:show,:edit,:update,:destroy] do
    resources :photo_comments, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
