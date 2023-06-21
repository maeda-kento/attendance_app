Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :managers do
    get 'staffs/index'
  end

  namespace :managers do
    get 'sessions/new'
  end

  namespace :managers do
    get 'sessions/create'
  end

  get 'staff/new'

  get    'staffs/sign_in',   to: 'staffs/sessions#new'
  post   'staffs/sign_in',   to: 'staffs/sessions#create'
  delete 'staffs/sign_out',  to: 'staffs/sessions#destroy'

  namespace :staffs do
    resources :tops, only: :index
    resources :attendances, only: [:index, :update]
    resource :registrations, only: [:show, :edit, :update]
    resource :password_resets, only: %i[new create edit update]
  end
  namespace :managers do
    resources :tops, only: :index
    resources :sessions, only: [:create, :new]
    resources :departments, only: [:index, :new, :create, :edit, :update, :destroy] do
      patch :sort, on: :collection
    end
    resources :staffs, only: [:index, :edit, :show, :update, :destroy] do
      scope module: :staffs do
        resources :attendances, only: [:index] do
          get :edit_one_month, on: :collection
          patch :update_one_month, on: :collection
        end
      end
    end
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
