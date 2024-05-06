Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get 'reviews/create'
      # get 'posts/create'
      # get 'posts/index'
      resources :posts, only: [:create, :index] do
        collection do
          get 'top'
        end
      end
      resources :reviews, only: [:create]
    end
  end
end
