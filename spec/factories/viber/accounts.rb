FactoryBot.define do
  factory :viber_account, class: Viber::Account do
    messenger { 'viber' }
  end
end
