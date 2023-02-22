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
