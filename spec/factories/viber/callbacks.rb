FactoryBot.define do
  factory :callback, class: Viber::Account do
    account { nil }
    event { 1 }
    timestamp { DateTime.zone.now }
    message_token { FFaker.numerify('##########') }
    data { nil }
  end
end
