Rails.application.routes.draw do
  devise_for :users
  get 'welcome', to: 'welcome#index'
  root 'welcome#index'
  resources :documents
end
