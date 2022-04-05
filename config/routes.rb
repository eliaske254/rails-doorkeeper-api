Rails.application.routes.draw do
  root "pages#home"

  use_doorkeeper
  devise_for :users
  resources :books

  draw :api
end
