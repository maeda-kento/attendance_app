Rails.application.routes.draw do
  get 'staff/new'

  get    'staffs/sign_in',   to: 'staffs/sessions#new'
  post   'staffs/sign_in',   to: 'staffs/sessions#create'
  delete 'staffs/sign_out',  to: 'staffs/sessions#destroy'

  namespace :staffs do
    resources :tops, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
