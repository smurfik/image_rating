Rails.application.routes.draw do

  root to: 'photos#main'

  get '/sign-up', to: 'users#sign_up', as: :sign_up
  post '/sign-up', to: 'users#create'
  get '/sign-out', to: 'users#sign_out', as: :sign_out
  get '/sign-in', to: 'users#sign_in', as: :sign_in
  post '/sign-in', to: 'users#sign_in_user'

end
