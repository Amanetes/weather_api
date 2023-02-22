# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherDatum do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:datetime) }
    it { is_expected.to validate_presence_of(:temperature) }
  end

  describe 'scopes' do
    describe '.current' do
      let!(:weather_data) { create(:weather_datum) }

      it 'returns current weather' do
        expect(described_class.current).to eq(weather_data)
      end
    end

    describe '.historical' do
      let!(:weather_data) { create_list(:weather_datum, 24) }

      it 'returns historical data for last 24 hours' do
        expect(described_class.historical).to match_array(weather_data)
      end
    end
  end
end
