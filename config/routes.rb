Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :members, only: [:new, :create] do
    collection do
      get :find
      post :find_confirm
    end
  end
  root to: 'pages#index'
end
