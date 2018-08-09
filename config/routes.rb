Rails.application.routes.draw do
  root 'habits#index'

  devise_for :users, :controllers => { :registrations => :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show]

  resources :habits, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :check_ins, only: [:show, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :habits, only: [:index, :show, :new, :create, :update, :destroy] do
        resources :check_ins, only: [:show, :update]
      end
    end
  end
end
