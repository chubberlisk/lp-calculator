Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'calculator', to: 'calculator#index', as: :calculator
  get '/', to: 'welcome#index', as: :welcome
end
