Rails.application.routes.draw do
  resources :exposures, only: [:index, :show]
end
