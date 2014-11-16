Rails.application.routes.draw do

  resources :exposures do
    collection do
      get :recent_index
      get :recent_count
    end
  end
end
