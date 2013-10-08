ToDo::Application.routes.draw do
  devise_for :users
  resources :tasks, :except => [:index]
  resources :lists
  
  root :to => 'lists#index'
end
