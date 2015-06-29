Rails.application.routes.draw do
  resources :rooms, path: '', only: [:show, :update, :destroy], param: :slug do
    member do
      get :archives

      resources :topics do
        member do
          post :vote
          post :remove_vote
          put :archive
        end
        collection do
          put :archive, action: :archive_all
        end
      end
    end
  end
  resources :rooms, path: 'rooms', except: [:show, :update, :destroy], param: :slug

  root to: 'rooms#index'
end
