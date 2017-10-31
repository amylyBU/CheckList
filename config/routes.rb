Rails.application.routes.draw do
  resources :lists do
  resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:destroy, :update, :show, :index]
  root 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
