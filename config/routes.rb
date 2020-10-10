Rails.application.routes.draw do
  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  get 'contacts/thanx', to: 'contacts#thanx'
  get 'privacy-policy', to: 'contacts#privacy_policy' 

  root 'landing_page#top'
  resources :users
  resources :posts
  get '/likes', to: 'posts#likes'
  get    '/login',  to: 'sessions#new'
  post    '/login' , to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
  resources :posts do
    post 'add' ,to: 'likes#create'
    delete '/add' ,to: 'likes#destroy'
  end
  get '/setting', to: 'users#setting'

  get 'change_password/:id', to: 'change_password#edit', as: :change_password_edit
  post 'change_password/:id', to: 'change_password#update', as: :change_password_update

  get 'change_email/:id', to: 'change_email#edit', as: :change_email_edit
  post 'change_email/:id', to: 'change_email#update', as: :change_email_update
end
