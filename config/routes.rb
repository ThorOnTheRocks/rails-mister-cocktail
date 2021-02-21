Rails.application.routes.draw do
  root to: 'cocktails#home'

  resources :cocktails, only: %i[home index show new create] do
    resources :doses, only: %i[new create]
  end

  resources :doses, only: :destroy
end

