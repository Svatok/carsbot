FactoryBot.define do
  factory :viber_user, class: Viber::User do
    external_id { FFaker.numerify('########') }
    name { "#{FFaker::Name.first_name} #{FFaker::Name.last_name}" }
    avatar { nil }
    country { FFaker::Address.country_code }
    language { FFaker::Locale.code }
    api_version { FFaker.numerify('#') }
  end
end
