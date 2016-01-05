Rails.application.routes.draw do

  root to: 'photos#main'

  get '/sign-up', to: 'users#sign_up', as: :sign_up
  post '/sign-up', to: 'users#create'
  get '/sign-out', to: 'users#sign_out', as: :sign_out

end
