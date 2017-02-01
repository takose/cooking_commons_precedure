Rails.application.routes.draw do

  get 'steps/new'

  get 'steps/create'

  get 'steps/destroy'

  get 'recipes/index'

  get 'recipes/new'

  get 'steps/get_img'

  root 'recipes#index'

  resources :recipes, only: [:index, :show, :new, :create, :update, :destroy]
  resources :steps, only: [:new, :create, :destroy]
  resources :elements, only: [:create, :destroy]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
