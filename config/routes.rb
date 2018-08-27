Rails.application.routes.draw do
  root 'habits#index'

  devise_for :users, :controllers => { :registrations => :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show]

  resources :habits do
    resources :check_ins, only: [:show, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :habits do
        resources :check_ins, only: [:index, :show, :update]
        resources :additional_check_ins, only: [:create]
      end
    end
  end
end
