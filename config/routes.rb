Rails.application.routes.draw do
  resources :fight_records
  get 'fight', to: 'users#fight'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
