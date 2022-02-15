Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :sleep_records, only: [] do
        collection do
          post 'create', to: 'sleep_records#create'
        end
      end
    end
  end
end
