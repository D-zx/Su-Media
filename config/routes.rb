Rails.application.routes.draw do
  get 'task/index'

  resources :assign_tasks
  resources :equipment
  resources :budgets
  get 'home/index'
  get 'home/login'
  get 'home/bootstrap'
  get 'home/adminmain'
  get 'home/batchbooknew'
  get 'home/pendingbatch'
  get 'home/batchlist'
  get 'home/logout'
  get 'home/duebatchbook'
  post 'home/duebatchbook', as:'duebatchbook'
  post 'home/logout', as:'logout'
  post 'home/batchlist', as:'batchlist'
  post 'home/pendingbatch', as: 'pendingbatch'
  post 'home/batchbooknew', as:'batchbooknew'
  post 'home/adminmain', as: 'adminmain'
  post 'home/login', as: 'login'
  post 'home/index', as: 'index'
  post 'home/bootstrap', as: 'bootstrap'

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end

  end
  resources :budgets

  resources :assign_tasks
  get 'task/index'
  get 'task/show'
  post 'task/index'
  post 'task/show'

  resources :equipment
  get 'profile/index'



  devise_for :users, controllers: { registrations: "registrations" }

  root to: "posts#index"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
