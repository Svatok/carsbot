module Viber
  class User < ::User
    belongs_to :account, class_name: 'Viber::Account', foreign_key: 'account_id', inverse_of: :users
  end
end
