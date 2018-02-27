Partitioning::Application.routes.draw do

  resources :account do
    resources :n_contact
    resources :p_contact
  end

  root :to => 'home#index'

end
