module Viber::User::Contract
  class Create < ::Lib::Contract::BaseInitializer
    option :id, optional: true, as: :external_id
    option :name, optional: true
    option :avatar, optional: true
    option :country, optional: true
    option :language, optional: true
    option :api_version, proc { |value| Types::NumericToString[value] }, optional: true
    option :subscribed, proc { true }, default: proc { true }
  end

  class Validator < ::Lib::Contract::BaseContract
    params do
      required(:external_id).filled(:str?)
      required(:name).filled(:str?)
      required(:avatar).filled(:str?)
      required(:country).filled(:str?)
      required(:language).filled(:str?)
      required(:api_version).filled(:str?)
      required(:subscribed).filled(:bool?)
    end
  end
end
