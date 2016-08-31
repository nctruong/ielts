Rails.application.routes.draw do
  devise_for :students, class_name: 'FormStudent' , :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  root to: "home#show"
  match "/students/:id/finish_signup", to: "students#finish_signup",
        via: [:get, :patch], as: :finish_signup
  # telling rails to use this class for building forms
  # devise_for :users, class_name: 'FormUser' , :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  #devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

=begin
  devise_scope :student do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end
=end

  #devise_for :students, class_name: 'FormUser' , :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  #get 'students/index'

  #get 'students/create'

  #get 'students/new'

  #get 'students/edit'

  #get 'students/show'

 # get 'students/update'

  #get 'students/destroy'

#  get 'student/create'

#  get 'student/new'

 # get 'student/edit'

#  get '/student/:id', to: 'student#show', :as => :student

#  get 'student/update'

#  get 'student/destroy'


  
#  get 'permission/sign_in'

#  get 'permission/sign_up'

#  get 'permission/sign_out'

#  get 'permission/index'

#  get 'sessions/create'

#  get 'sessions/destroy'

#  get 'home/show'
=begin

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/' => 'index#index'
    end
  end
=end

  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  #get 'signout', to: 'sessions#destroy', as: 'signout'



  #get 'session/create', to: 'sessions#create'
  resources :sessions, only: [:create, :destroy]
  #resource :homes, only: [:show]
  #resource :students


end
