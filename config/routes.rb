Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :spots, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :bookmarks, only: [:create]
    resources :favourites, only: [:create]
    resources :visits, only: [:create]
    collection do
      get :randomise
    end
  end

  resources :bookmarks, only: [:index, :update]
  resources :favourites, only: [:index, :update]
  resources :visits, only: [:index]
end
