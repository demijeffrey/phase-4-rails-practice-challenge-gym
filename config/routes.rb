Rails.application.routes.draw do
  
  resources :clients, only: [:index, :show]
  resources :gyms, only: [:index, :show, :destroy]

  post '/new_member', to: 'gyms#new_membership'

end