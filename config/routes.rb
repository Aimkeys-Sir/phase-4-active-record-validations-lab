Rails.application.routes.draw do
  resources :authors, only:[:show,:index,:create,:update]
  resources :posts, only:[:show,:index,:create,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
