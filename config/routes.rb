Sims::Application.routes.draw do

  resources :users
  resources :divorces
  resources :weddings

  resources :user_sessions
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'

  resources :inhabitants do
    collection do
      get :church
      get :court
    end
  end

  match 'login' => 'user_sessions#new', :via => [:get, :post], :as => :login
  match 'logout' => 'user_sessions#destroy', :via => [:get, :post], :as => :logout

  match 'inhabitants/church' => 'inhabitants#church', :via => [:get, :post], :as => :church
  match 'inhabitants/court' => 'inhabitants#court', :via => [:get, :post], :as => :court

  root :to => 'user_sessions#new'
end
