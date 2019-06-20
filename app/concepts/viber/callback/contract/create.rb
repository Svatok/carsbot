module Viber::Callback::Contract
  class Create < ::Lib::Contract::BaseInitializer
    option :event, optional: true
    option :timestamp, proc { |value| Types::NumericToString[value] }, optional: true
    option :message_token, proc { |value| Types::NumericToString[value] }, optional: true
  end

  class Validator < ::Lib::Contract::BaseContract
    params do
      required(:event).filled(included_in?: ::Viber::Callback.events.keys)
      required(:timestamp).filled(:str?)
      required(:message_token).filled(:str?)
    end
  end
end
