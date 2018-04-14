Rails.application.routes.draw do
  devise_for :users
  get 'search', to: 'users#search'
  post 'liked', to: 'users#like'
  post 'not_liked', to: 'users#not_like'
  get 'no_more', to: 'users#no_more'
  get 'match', to: 'users#match'
  get 'matches', to: 'users#matches'
  get 'chat', to: 'chats#show'
  get 'send_message', to: 'chats#create'
  root 'users#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
