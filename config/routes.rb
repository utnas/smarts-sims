Sims::Application.routes.draw do

  resources :users, :divorces, :weddings

  resources :user_sessions
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'

  resources :inhabitants do
    get :church, on: :collection
    get :court, on: :collection
  end

  match 'inhabitants/church' => 'inhabitants#church', :via => [:get], :as => :church
  match 'inhabitants/court' => 'inhabitants#court', :via => [:get], :as => :court

  match 'login' => 'user_sessions#new', :via => [:get, :post], :as => :login
  match 'logout' => 'user_sessions#destroy', :via => [:get, :post], :as => :logout

  root :to => 'user_sessions#new'
end
