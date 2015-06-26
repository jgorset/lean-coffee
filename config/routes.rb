Rails.application.routes.draw do
  resources :topics
  put 'topics/:id/vote' => 'topics#vote'
  put 'topics/:id/remove_vote' => 'topics#remove_vote'

  resources :rooms, path: '', only: [:show, :update, :destroy], param: :slug
  resources :rooms, path: 'rooms', except: :show, param: :slug
  # get ":slug", to: "rooms#show", as: :room
  root to: 'rooms#index'
end
