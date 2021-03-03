Rails.application.routes.draw do
  get 'reviews/index'
  root 'homes#top'
  get '/access' => 'homes#access'

  # 管理者側
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }
  namespace :admin do
    resources :reservations, only:[:index, :show, :update]
    resources :contacts, only:[:index, :show, :update]
    get 'searchs/search' => 'searchs#search', as: 'search'
  end
  # HP側
    devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }
  resources :customers, only:[:show, :edit, :update] do
    member do
      get :mypage
    end
  end
  resources :reservations, only:[:create, :update] do
    collection do
      get :search
      post :room
      post :guest
      post :confirm
      get :success
    end
  end
  resources :rooms, only:[:index]
  resources :reviews, only:[:index, :new, :create]
  resources :contacts, only:[:new, :create] do
    collection do
      get :success
      post :confirm
    end
  end
end
