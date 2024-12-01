Rails.application.routes.draw do
  root "home#index"
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  # Uncomment this route if you plan to implement a login system in the future
  #get '/sessions/new', to: 'sessions#new', as: 'sessions_new'

  # Generates standard RESTful routes for the PrivateClassController
  resources :private_class, controller: 'private_class'
  
  # Generates standard RESTful routes for the GroupClassController
  resources :group_class, controller: 'group_class' do
    member do
      get 'book' # Route to show the booking page
      post 'book' # Route to handle the booking submission
    end
  end

  # Uncomment these routes if gym_staff and gym_member controllers and views are implemented
  # resources :gym_staff, only: [:index, :show, :edit, :update, :destroy]
  # resources :gym_member, only: [:index, :show]
end
