Rails.application.routes.draw do
  root "video_games#index"

  devise_for :users

  resources :video_games
end
