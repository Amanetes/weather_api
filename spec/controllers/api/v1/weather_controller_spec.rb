# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::WeatherController do
  describe 'GET #health' do
    it 'returns correct response status' do
      get(:health)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #current' do
    it 'returns correct response status' do
      get(:current)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #by_time' do
    context 'when params are present' do
      it 'returns correct response status' do
        get(:by_time, params: { input: 1_677_052_680 })
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when params are missing' do
      it 'returns correct response status' do
        get(:by_time, params: { input: nil })
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
