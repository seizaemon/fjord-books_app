Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  resources :users do
    member do
      get 'followers'
      get 'followings'
    end
  end
  resource :follow_relation, only: %i(create destroy)
end

