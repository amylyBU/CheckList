Rails.application.routes.draw do
  resources :lists do
    resources :tasks, only: [:new, :create, :update, :edit] do
      put 'update_completion', :action => 'update_completion', on: :collection
    end
  end

  resources :tasks, only: [:destroy, :show, :index]
  root 'lists#index'
end
