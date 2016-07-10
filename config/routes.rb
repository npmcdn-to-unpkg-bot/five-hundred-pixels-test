Rails.application.routes.draw do
  root 'search#index'
  resources :search, only: [:create] do
    collection do
      get '/:search_term', action: :results, as: :results
      get '/:search_term/click/:external_id', action: :click, as: :click
      get '/:search_term/:page', action: :results, as: :more_results
    end
  end
end
