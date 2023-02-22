# frozen_string_literal: true

module Api
  module V1
    class WeatherController < ApplicationController
      def health
        head :ok
      end

      def current
        render json: WeatherDatumBlueprint.render(WeatherDatum.current), status: :ok
      end

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

      def by_time
        if params[:input].blank?
          render json: { error: 'Input parameter is missing' }, status: :unprocessable_entity
        else
          render json: WeatherDatumBlueprint.render(WeatherDatum.by_time(params[:input].to_i)), status: :ok
        end
      end
    end
  end
end
