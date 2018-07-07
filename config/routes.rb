Rails.application.routes.draw do
  root 'game#main'
  post '/', to: 'game#main'

  resources :events, only: [:new, :create, :show]
end
