Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :viber do
        resource :callbacks, only: :create
      end
    end
  end
end
