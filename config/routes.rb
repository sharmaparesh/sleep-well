Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :sleep_records, only: [] do
        collection do
          get '', to: 'sleep_records#index'
          post 'create', to: 'sleep_records#create'
        end

        member do
          put ':id/complete', to: 'sleep_records#complete'
          delete ':id', to: 'sleep_records#delete'
        end
      end
    end
  end
end
