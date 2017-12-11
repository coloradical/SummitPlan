Rails.application.routes.draw do
  resources :fourteeners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'fourteeners#index'
end
