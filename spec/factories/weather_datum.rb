# frozen_string_literal: true

FactoryBot.define do
  factory :weather_datum do
    temperature { Faker::Number.between(from: -30.0, to: 40.0).round(1) }
    datetime { Faker::Time.between_dates(from: Time.zone.today - 1, to: Time.zone.today, period: :all).to_i }
  end
end
