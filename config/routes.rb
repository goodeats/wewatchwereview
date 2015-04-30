Rails.application.routes.draw do

  devise_for :users
  resources :movies do
    resources :reviews#, shallow: true
  end

  resources :reviews

  root 'welcome#index'
  get "about" => "pages#about"

end
