Partitioning::Application.routes.draw do

  resources :accounts do
    resources :contacts
  end

  root :to => 'home#index'

end
