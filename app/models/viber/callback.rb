module Viber
  class Callback < ::Callback
    enum event: { subscribed: 1 }

    belongs_to :account, class_name: 'Viber::Account', foreign_key: 'account_id', inverse_of: :callbacks
  end
end
