Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins
  devise_for :users

  namespace :admin do
    get '/', to: 'base#dashboard'
    resources :categories, except: :show
    resources :posts, except: :show
    resources :pages, except: :show
    resources :file_items, only: [:index, :show, :create, :destroy]
  end

  root to: 'public#homepage'

  resources :posts, only: [:index, :show]

  resources :pages, only: [:index]
  get '/:slug', to: 'pages#show'
end
