Rails.application.routes.draw do
  get 'parsing_jobs/new'
  post 'parsing_jobs', to: 'parsing_jobs#create'
  get 'parsing_jobs', to: 'parsing_jobs#index'
  resources :characteristics_products
  resources :products
  resources :characteristics
  resources :measure_units
  resources :subcategories
  resources :categories
end
