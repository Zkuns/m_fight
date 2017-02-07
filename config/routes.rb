Rails.application.routes.draw do
  resources :fight_records
  get 'fight', to: 'users#fight'

  # Omniauth
  get '/auth/:provider/callback', to: 'users#user_info'
end
