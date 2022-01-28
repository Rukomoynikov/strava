Rails.application.routes.draw do
  root "pages#home"

  namespace :user do
    resources :credentials, only: [:new]
  end
end
