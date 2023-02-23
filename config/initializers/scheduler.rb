# frozen_string_literal: true

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Call WeatherLoaderService in 10 seconds after server startup
# scheduler.in '10s' do
#   WeatherLoaderService.call
#   Rails.logger.info "WeatherDataLoader called at #{Time.zone.now}"
# end

# Call WeatherLoaderService every 3 hours
scheduler.every '3h' do
  WeatherLoaderService.call
  Rails.logger.info "WeatherDataLoader called at #{Time.zone.now}"
end
