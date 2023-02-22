# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Historical::WeatherController do
  describe 'GET #historical' do
    it 'returns correct response status' do
      get(:historical)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #average' do
    let!(:weather_datum1) { create(:weather_datum, temperature: -13.2, datetime: Time.zone.now) }
    let!(:weather_datum2) { create(:weather_datum, temperature: 14.7, datetime: 24.hours.ago) }

    it 'returns correct response status' do
      get(:average)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #max' do
    it 'returns correct response status' do
      get(:max)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #min' do
    it 'returns correct response status' do
      get(:min)
      expect(response).to have_http_status(:ok)
    end
  end
end
