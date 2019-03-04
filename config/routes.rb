Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  concern :repliable do
    resources :replies do
      concerns :voteable
    end
  end

  concern :commentable do
    resources :comments do
      concerns :voteable
      concerns :repliable
    end
  end

  concern :voteable do
    member do
      post :upvote
      post :downvote
      get :upvoters
      get :downvoters
    end
  end

  concern :shareable do
    member do
      post :share
    end
  end

  concern :followable do
    member do
      post :follow
      get :followers
    end
  end

  resources :questions, except: [:index], concerns: [:commentable, :voteable, :shareable, :followable]

  resources :answers, concerns: [:commentable, :voteable, :shareable]

  resource :topics, concerns: [:followable]

  resources :topics, only: [:show], concerns: [:followable]

  post '/users/:id/follow' => 'users#follow'
end
