CrewCall::Application.routes.draw do
  
  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users, :controllers => { :registrations => 'registrations' }, :path => 'profile', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end

  #User Routes
  resources :users, :path => "profile"
  match "profiles" => "users#index"

  #Job Posting Routes
  resources :jobs

end