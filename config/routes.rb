Rails.application.routes.draw do
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  post '/cocktails', to: 'cocktails#create'
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
end
