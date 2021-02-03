Rails.application.routes.draw do
  root 'homes#top'
  get '/access' => 'homes#access'
  # 管理者側
  devise_for :admins
  namespace :admin do
    resources :reservations, only:[:index, :show]
    resources :contacts, only:[:index, :show, :update]
  end
  # HP側
  resources :reservations, only:[:create] do
    collection do
      get :search
      post :confirm
      get :success
    end
  end
  resources :rooms, only:[:index]
  resources :guest, only:[:new]
  resources :contacts, only:[:new, :create] do
    collection do
      get :success
    end
  end
end
