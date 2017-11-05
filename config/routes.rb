Rails.application.routes.draw do
  resources :lists do
    resources :tasks, only: [:new, :create, :update, :edit]
  end

  resources :tasks, only: [:destroy, :show, :index]
  root 'lists#index'
end
