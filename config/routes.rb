Rails.application.routes.draw do
  root 'robots#index'

  resources :robots do
    member do
      get :move
      get :left
      get :right
      get :report
    end
  end
end
