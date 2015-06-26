Rails.application.routes.draw do
  resources :topics

  post 'topics/:id/vote' => 'topics#vote'
  post 'topics/:id/remove_vote' => 'topics#remove_vote'

  root to: 'topics#index'
end
