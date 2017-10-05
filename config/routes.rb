Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  namespace :admin do
    get '/', to: 'admin#dashboard'
  end

  root to: 'public#homepage'
end
