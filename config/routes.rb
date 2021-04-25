Rails.application.routes.draw do
  resources :characteristics_products
  resources :products
  resources :characteristics
  resources :measure_units
  resources :subcategories
  resources :categories
end
