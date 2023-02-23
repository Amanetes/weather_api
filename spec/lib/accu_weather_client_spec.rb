# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccuWeatherClient do
  subject(:client) { described_class.call }

  before do
    allow(described_class).to receive(:location).and_return('2160760')
  end

  describe '#call' do
    context 'when client fetches weather data' do
      it 'has correct attributes', :vcr do
        client
        expect(client.first.keys).to include('EpochTime', 'Temperature')
      end
    end
  end
end
