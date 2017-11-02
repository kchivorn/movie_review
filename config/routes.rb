Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    collection do
      get 'autocomplete'
    end
    resources :reviews, except: [:show, :index]
  end
  root "movies#index"
end
