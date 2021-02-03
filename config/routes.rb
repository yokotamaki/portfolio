Rails.application.routes.draw do
  namespace :admin do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :admin do
    get 'contacts/index'
    get 'contacts/show'
  end
  get 'contacts/new'
  get 'contacts/success'
  get 'reservations/search'
  get 'reservations/confirm'
  get 'reservations/success'
  get 'rooms/index'
  get 'homes/top'
  get 'homes/address'
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
