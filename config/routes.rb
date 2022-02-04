Rails.application.routes.draw do
  root "pages#home"

  namespace :user do
    resources :credentials, only: [:new]
  end

  namespace :strava do
    get "subscriptions/incoming", to: "subscriptions#incoming"
    post "subscriptions/incoming", to: "subscriptions#webhook"
  end
end
