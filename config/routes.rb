Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :questions do
    member do
      post :upvote
      post :follow
      post :comment
    end
  end
end
