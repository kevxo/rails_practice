Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :parents
  resources :childrens, only: %i[index show edit update]

  get '/parents/:parent_id/childrens', to: 'parent_child#index'
  get '/parents/:parent_id/childrens/new', to: 'parent_child#new'
  post '/parents/:parent_id/childrens', to: 'parent_child#create'

end
