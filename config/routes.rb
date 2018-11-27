Rails.application.routes.draw do
  devise_for :users
  
  devise_for :admin_users
  namespace :admin do
      resources :users
      resources :admin_users
      resources :duels
      root to: "users#index"
    end

  root 'welcome#index'
  get '/', to: 'welcome#index', as: :welcome
  
  get 'calculator', to: 'calculator#index', as: :calculator
  post 'calculator/add_player_two', to: 'calculator#add_player_two', as: :add_player_two
  
  scope '/users/:user_id' do
    get '/', to: 'users#show', as: :user_profile
  end
end
