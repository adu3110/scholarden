Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  get 'about' => 'pages#about', as: 'about'

  get 'showfollowers' => 'users#showfollowers', as: 'showfollowers'
  get 'showfollowing' => 'users#showfollowing', as: 'showfollowing'
  
  resources :posts do
    resources :comments
  end

  resource :friendships, only: [:create, :destroy]
  resource :likeposts, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

  get 'conversationhome' => 'conversations#index', as: 'conversationhome'
end
