Rails.application.routes.draw do
  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'
  put '/questions/:id/unhide', to: 'questions#unhide'
end
