Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get :mypage, to: 'users#show', as: :mypage
  root 'products#index'
  resources :products
  resources :categories
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :manage do
    resources :products
  end

end
