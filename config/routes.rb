Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :destroy, :update] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    resources :favorites, only: [:index]
  end
  resources :contacts, only: [:create, :show, :destroy, :update] do
    resources :comments, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  # get 'users' => 'users#index', as: 'users'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new', as: 'new_user'
  # get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  # get 'users/:id' => 'users#show', as: 'user'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
end
