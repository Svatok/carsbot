module Api
  module V1
    class BaseController < ::ApplicationController
      include Trailblazer::Rails::Controller
    end
  end
end
