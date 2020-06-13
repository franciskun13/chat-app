Rails.application.routes.draw do
  
  root 'sessions#new'
  get 'chatroom', to: 'chatroom#index'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
end