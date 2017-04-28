Rails.application.routes.draw do

  resources :courses, only: [:show]

  devise_for :students, controllers: {
    sessions: 'students/sessions'
  }


  resources :students, only: [:show, :edit, :update, :calculate_gpa] do
    member do
      put :calculate_gpa
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "landing_page#index"
end

