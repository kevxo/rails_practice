Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :parents, only: %i[index show]
  resources :childrens, only: %i[index show]

  get '/parents/:parent_id/childrens', to: 'parent_child#index'
end
