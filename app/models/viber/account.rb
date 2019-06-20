module Viber
  class Account < ::Account
    default_scope { viber }

    has_many :users, dependent: :destroy, inverse_of: :account, class_name: 'Viber::User'
    has_many :callbacks, dependent: :destroy, inverse_of: :account, class_name: 'Viber::Callback'
  end
end
