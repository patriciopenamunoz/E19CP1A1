Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :projects
  resources :people

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
