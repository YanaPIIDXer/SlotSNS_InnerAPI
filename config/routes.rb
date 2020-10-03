Rails.application.routes.draw do
  get 'post/index'
  post 'post/create'
  post 'post/update'
  post 'post/delete'
  get 'user/index'
  post 'user/create'
  post 'user/update'
  post 'user/delete'
  get 'session/index'
  post 'session/create'
  post 'session/delete'
  root :to => 'health#index'
end
