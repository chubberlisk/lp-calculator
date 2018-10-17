Rails.application.routes.draw do
  get 'calculator', to: 'calculator#index', as: :calculator
  get '/', to: 'welcome#index', as: :welcome

  root 'welcome#index'
end
