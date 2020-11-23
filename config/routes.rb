Rails.application.routes.draw do
  devise_for :users
  root to: 'infomations#index'
  resources :infomations,only:[:index,:new,:create,:show] do
    resources :comments,only:[:show,:create,:edit,:update,:destroy] do
      resources :answers,only:[:create]
    end
  end
  resources :users,only:[:show,:edit,:update]
  resources :infomations do
    resources :favorites,only:[:create,:destroy]
  end
  resources :photos,only:[:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
