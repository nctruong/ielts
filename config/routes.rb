Rails.application.routes.draw do
#  get 'student/create'

#  get 'student/new'

 # get 'student/edit'

#  get '/student/:id', to: 'student#show', :as => :student

#  get 'student/update'

#  get 'student/destroy'

  get 'student/index'
  
  get 'permission/sign_in'

  get 'permission/sign_up'

  get 'permission/sign_out'

  get 'permission/index'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/' => 'index#index'
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'



  get 'session/create', to: 'sessions#create'
  resources :sessions, only: [:create, :destroy]
  resource :homes, only: [:show]
  resource :students

  root to: "home#show"
end
