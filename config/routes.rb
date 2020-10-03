Rails.application.routes.draw do
  get 'user/index'
  post 'user/create'
  post 'user/update'
  post 'user/delete'
  get 'session/index'
  post 'session/create'
  post 'session/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "register" => "register#index"
  root :to => 'health#index'
end
