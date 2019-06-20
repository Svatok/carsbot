module Viber::User::Contract
  class Create < ::Dry::Validation::Contract
    params do
      required(:external_id).value(:string).filled(:str?)
      required(:name).value(:string).filled(:str?)
      required(:avatar).value(:string).filled(:str?)
      required(:country).value(:string).filled(:str?)
      required(:language).value(:string).filled(:str?)
      required(:api_version).filled { str? | int? }
    end
  end
end
