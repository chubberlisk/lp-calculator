Rails.application.routes.draw do
  namespace :admin do
      resources :users
      root to: "users#index"
    end
  devise_for :users
  root 'welcome#index'
  get 'calculator', to: 'calculator#index', as: :calculator
  get '/', to: 'welcome#index', as: :welcome
end
