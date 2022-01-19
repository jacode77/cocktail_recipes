Rails.application.routes.draw do
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'

end
