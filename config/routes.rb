Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  get 'contacts/thanx', to: 'contacts#thanx'
  get 'privacy-policy', to: 'contacts#privacy_policy'
  get '/question', to: 'contacts#question' 

  root 'landing_page#top'
  resources :users
  resources :posts, except:[:index]
  get '/index/:id', to: 'posts#index'
  get '/likes', to: 'posts#likes'
  get '/steps', to: 'posts#steps',as: :posts_steps
  
  get    '/login',  to: 'sessions#new'
  post    '/login' , to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
  resources :posts do
    post 'add' ,to: 'likes#create'
    delete '/add' ,to: 'likes#destroy'
  end
  get '/setting', to: 'users#setting'
  get '/vaild_wait', to: 'users#vaild_wait'
  get '/admin', to: 'users#admin'
  

  get 'change_password/:id', to: 'change_password#edit', as: :change_password_edit
  post 'change_password/:id', to: 'change_password#update', as: :change_password_update

  get 'change_email/:id', to: 'change_email#edit', as: :change_email_edit
  post 'change_email/:id', to: 'change_email#update', as: :change_email_update

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get '/reception', to: 'password_resets#reception'
  get '/success', to: 'password_resets#success'

end
