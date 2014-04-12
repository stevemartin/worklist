Worklist::Application.routes.draw do

  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  devise_scope :user do
    post 'login' => 'sessions#create', :as => 'login'
    post 'logout' => 'sessions#destroy', :as => 'logout'
    get 'current_user' => 'sessions#show_current_user', :as => 'show_current_user'
  end

  post 'users/profile' => 'user/profiles#create'
  put 'users/profile' => 'user/profiles#update'
  get 'me/:url' => 'cvs#show'
  put 'me/:url' => 'cvs#update'

  resources :users do
    resource :profile, :controller => 'user/profiles'
  end

  root 'home#show'

  get '/:url' => 'cvs#show'
  get '/:url' => 'cvs#update'

end
