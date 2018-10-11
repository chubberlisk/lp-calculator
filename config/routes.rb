Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: :welcome

  root 'welcome#index'
end
