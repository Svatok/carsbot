module Viber::Callback::Contract
  class Create < ::Dry::Validation::Contract
    params do
      required(:event).filled(included_in?: ::Viber::Callback.events.keys)
      required(:timestamp).filled { str? | int? }
      required(:message_token).filled { str? | int? }
    end
  end
end
