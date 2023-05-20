Rails.application.routes.draw do
 
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  devise_for :users
  resources :photos , only: [:index,:new,:create,:show,:edit,:update,:destroy] 
  resources :users, only: [:edit,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
