Rails.application.routes.draw do
  # devise_for :customers
  # devise_for :users
  root 'homes#top'
  get '/access' => 'homes#access'
  # resources :users
  # devise_for :users

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }

  # 管理者側
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }
  # devise_for :admins
  namespace :admin do
    resources :reservations, only:[:index, :show]
    resources :contacts, only:[:index, :show, :update]
    get 'searchs/search' => 'searchs#search', as: 'search'
  end
  # HP側
  resources :customers, only:[:show] do
    member do
      get :mypage
    end
  end
  resources :reservations, only:[:create] do
    collection do
      get :search
      post :room
      post :guest
      post :confirm
      get :success
    end
  end
  resources :rooms, only:[:index]
  resources :contacts, only:[:new, :create] do
    collection do
      get :success
      post :confirm
    end
  end
end
