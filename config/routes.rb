Rails.application.routes.draw do
  root "home#index"
  
  # About and Contact Routes
  get 'home/about', to: 'home#about', as: 'home_about'
  get 'home/contact', to: 'home#contact', as: 'home_contact'

  # Sessions (Login) Route
  get '/login', to: 'sessions#new'

  # RESTful Routes for Private Classes
  resources :private_classes, controller: 'private_class'

  # RESTful Routes for Group Classes
  resources :group_classes, controller: 'group_class' do
    member do
      get 'book' # Route to show the booking page
      post 'book' # Route to handle the booking submission
    end
  end

  # Uncomment these routes if gym_staff and gym_member controllers and views are implemented
  # resources :gym_staff, only: [:index, :show, :edit, :update, :destroy]
  # resources :gym_member, only: [:index, :show]
end
