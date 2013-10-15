FriendCircle::Application.routes.draw do
  resources :users
  resources :circles
  resource :session, :only => [:new, :create, :destroy]
  resource :reset_password, :only => [:new, :create, :show] do
    member do
      post 'reset'
    end
  end
end
