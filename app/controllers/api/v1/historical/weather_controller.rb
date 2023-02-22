# frozen_string_literal: true

module Api
  module V1
    module Historical
      class WeatherController < ApplicationController
        def historical
          render json: WeatherDatumBlueprint.render(WeatherDatum.historical), status: :ok
        end

        def average
          render json: { average: WeatherDatum.avg_temperature }, status: :ok
        end

        def min
          render json: WeatherDatumBlueprint.render(WeatherDatum.min_temperature), status: :ok
        end

        def max
          render json: WeatherDatumBlueprint.render(WeatherDatum.max_temperature), status: :ok
        end
      end
    end
  end
end
