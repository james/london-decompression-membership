Rails.application.routes.draw do
  resources :members, only: [:new, :create] do
    collection do
      get :find
      post :find_confirm
    end
  end
  root to: 'pages#index'
end
