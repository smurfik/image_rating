Rails.application.routes.draw do

  root to: 'photos#main'
  get '/photos', to: 'photos#index', as: :photos
  post '/photos', to: 'photos#create'
  get '/photos/new', to: 'photos#new', as: :new_photo
  get '/photos/review', to: 'photos#review', as: :review_photo
  post '/photos/review', to: 'photos#review_photo'
  get '/photos/:id', to: 'photos#show', as: :photo
  delete '/photos/:id', to: 'photos#destroy'

  get '/sign-up', to: 'users#sign_up', as: :sign_up
  post '/sign-up', to: 'users#create'
  get '/sign-out', to: 'users#sign_out', as: :sign_out
  get '/sign-in', to: 'users#sign_in', as: :sign_in
  post '/sign-in', to: 'users#sign_in_user'

end
