FactoryBot.define do
  factory :viber_callback, class: Viber::Callback do
    account { nil }
    event { 1 }
    timestamp { Time.zone.now }
    message_token { FFaker.numerify('##########') }
    data { nil }
  end
end
