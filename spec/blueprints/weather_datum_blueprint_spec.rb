# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherDatumBlueprint do

  subject(:blueprint) { described_class.render_as_hash(weather_datum) }

  let!(:weather_datum) { create(:weather_datum) }
  let(:datetime) { Time.zone.at(weather_datum.datetime).strftime('%Y-%m-%d %H:%M:%S') }

  it 'returns correct base data' do
    expect(blueprint[:id]).to eq(weather_datum.id)
    expect(blueprint[:datetime]).to eq(datetime)
    expect(blueprint[:temperature]).to eq(weather_datum.temperature)
  end
end
