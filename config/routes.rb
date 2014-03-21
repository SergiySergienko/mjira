RailsDevisePundit::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :tickets, except: [:index, :destroy] do
    resources :comments, except: [:index, :show, :edit, :destroy]
  end

  namespace :admin do
    get 'quick_jump', to: 'tickets#quick_jump'
    resources :tickets do
      get 'assign', to: 'assigments#update_assigment'
      resources :comments
    end
  end
end