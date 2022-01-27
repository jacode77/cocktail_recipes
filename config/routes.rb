Rails.application.routes.draw do

  root to: 'pages#home'
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  post '/cocktails', to: 'cocktails#create', as: 'create_cocktail'
  get '/cocktails/new', to: 'cocktails#new', as: 'new_cocktail' #Two things will happen. Will render a form with a submit button
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
  put '/cocktails/:id', to: 'cocktails#update', as: 'update_cocktail'
  patch '/cocktails/:id', to: 'cocktails#update'
  delete '/cocktails/:id', to: 'cocktails#destroy'
  get '/cocktails/:id/edit', to: 'cocktails#edit', as: 'edit_cocktail'
end
