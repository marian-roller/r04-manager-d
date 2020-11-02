Rails.application.routes.draw do
  resources :mymovies
  resources :movies
  get 'onlymovies', to: 'movies#onlyMovies'
  get 'onlytvseries', to: 'movies#onlyTvseries'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
