module Api
  module V1
    module Viber
      class UserAuthenticationController < BaseController
        before_action :authenticate_user!

        private

        def _run_options(ctx)
          ctx.merge(current_user: current_user)
        end
      end
    end
  end
end
