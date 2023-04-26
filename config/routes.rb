Rails.application.routes.draw do

  root to: 'questions#index'

  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'
  put '/questions/:id/unhide', to: 'questions#unhide'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
end
