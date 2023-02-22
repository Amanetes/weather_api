# frozen_string_literal: true

class WeatherDatumBlueprint < ApplicationBlueprint
  field :temperature
  field :datetime do |weather_datum|
    Time.zone.at(weather_datum.datetime).strftime('%Y-%m-%d %H:%M:%S')
  end
end
