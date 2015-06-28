Rails.application.routes.draw do
  resources :rooms, path: '', only: [:show, :update, :destroy], param: :slug do
    member do
      resources :topics
      post 'topics/:id/vote' => 'topics#vote'
      post 'topics/:id/remove_vote' => 'topics#remove_vote'
      put 'topics/:id/archive' => 'topics#archive'
    end
  end
  resources :rooms, path: 'rooms', except: [:show, :update, :destroy], param: :slug

  root to: 'rooms#index'
end
