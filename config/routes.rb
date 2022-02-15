Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :sleep_records, only: [] do
        collection do
          post 'create', to: 'sleep_records#create'
        end

        member do
          put ':id/complete', to: 'sleep_records#complete'
        end
      end
    end
  end
end
