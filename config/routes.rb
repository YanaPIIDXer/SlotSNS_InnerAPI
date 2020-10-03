Rails.application.routes.draw do
  get 'health/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "register" => "register#index"
end
