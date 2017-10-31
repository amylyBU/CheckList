Rails.application.routes.draw do
  resources :lists do
    resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:destroy, :update, :show, :index]
  root 'lists#index'
end
