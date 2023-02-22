# frozen_string_literal: true

class AccuWeatherClient
  extend IpFinder
  class << self
    def call
      weather
    end

    private

    def connection
      @connection ||= Faraday.new(url: ENV.fetch('BASE_URL'))
    end

    def ip_address
      @ip_address ||= IpFinder.find_ip
    end

    def location
      @location ||=
        begin
          response = connection.get('/locations/v1/cities/ipaddress', { apikey: ENV.fetch('API_KEY'), q: ip_address })
          data = JSON.parse(response.body)
          data['Key']
        rescue StandardError => e
          Rails.logger.error [e.message, e.backtrace].join($INPUT_RECORD_SEPARATOR)
        end
    end

    def weather
      response = connection.get("/currentconditions/v1/#{location}/historical/24", { apikey: ENV.fetch('API_KEY') })
      JSON.parse(response.body)
    rescue StandardError => e
      Rails.logger.error [e.message, e.backtrace].join($INPUT_RECORD_SEPARATOR)
    end
  end
end
