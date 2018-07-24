Rails.application.routes.draw do
  resources :members
  root to: 'pages#index'
end
