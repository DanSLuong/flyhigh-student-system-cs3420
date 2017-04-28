Rails.application.routes.draw do

  devise_for :students


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "landing_page#index"
end

