module Api
  module V1
    module Viber
      class CallbacksController < BaseController
        include ::Authenticable::Viber
        before_action :authenticate!

        def create
          run ::Viber::Callback::Operation::Create, params: request.request_parameters

          head :ok
        end
      end
    end
  end
end
