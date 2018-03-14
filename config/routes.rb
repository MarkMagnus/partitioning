Partitioning::Application.routes.draw do

  get :search, to: 'accounts#search'
  post :search, to: 'accounts#search'

  resources :accounts do
    resources :contacts
  end

  root :to => 'home#index'

end
