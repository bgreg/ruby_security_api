Rails.application.routes.draw do
  resources :exposures, only: [:index, :show] do
    collection do
      get :recent_index
      get :recent_count
      get :index_short
    end
  end
end
