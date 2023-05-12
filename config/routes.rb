Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    member do
      put :hide
      put :unhide
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]

  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
  
end
