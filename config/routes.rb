Rails.application.routes.draw do
  resources :users do
    resources :organisations do
      resources :managements do
        resources :activities
      end
    end
  end
  root 'users#index'
end
