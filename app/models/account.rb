class Account < ApplicationRecord
  enum messenger: { viber: 1 }
end
