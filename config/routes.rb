Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  namespace :admin do
    get '/', to: 'base#dashboard'
    resources :categories, except: :show
  end

  root to: 'public#homepage'
end
