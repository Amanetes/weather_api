# frozen_string_literal: true

class WeatherLoaderService
  class << self
    def call
      load_weather_data
    end

    private

    def load_weather_data
      weather_data = AccuWeatherClient.call
      weather_data.each do |data|
        WeatherDatum.find_or_create_by(datetime: data['EpochTime']) do |weather_datum|
          weather_datum.temperature = data.dig('Temperature', 'Metric', 'Value')
        end
      end
    rescue StandardError => e
      Rails.logger.error [e.message, e.backtrace].join($INPUT_RECORD_SEPARATOR)
    end
  end
end
