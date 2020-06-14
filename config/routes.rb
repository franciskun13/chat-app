Rails.application.routes.draw do
  
  root 'sessions#new'
  get 'chatroom', to: 'chatroom#index'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
  
end