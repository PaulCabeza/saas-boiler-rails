Rails.application.routes.draw do
  resources :members
  get 'home/index'
  get 'home/welcome'
  root :to => "home#index"
  get 'home/welcome', as: :welcome

  
  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match '/user/confirmation' => 'philia/confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "philia/registrations",
    :confirmations => "philia/confirmations",
    :sessions => "philia/sessions",
    :passwords => "philia/passwords",
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
