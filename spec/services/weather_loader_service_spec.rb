# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherLoaderService do
  subject(:service) { described_class.call }

  let(:weather_data) do
    [{ 'EpochTime' => 1_677_033_723,
       'Temperature' => {
         'Metric' => {
           'Value' => 5
         }
       } }]
  end

  before do
    allow(AccuWeatherClient).to receive(:call).and_return(weather_data)
  end

  describe '#call' do
    context 'when client returns correct weather data' do
      it 'creates new WeatherDatum record in database' do
        expect { service }.to change(WeatherDatum, :count).by(1)
      end
    end

    context 'when client returns correct data with the same datetime' do
      let!(:weather_datum) { create(:weather_datum, datetime: 1_677_033_723) }

      it 'does not create duplicate records' do
        expect { service }.not_to change(WeatherDatum, :count)
      end
    end
  end
end
