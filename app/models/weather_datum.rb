# frozen_string_literal: true

class WeatherDatum < ApplicationRecord
  validates :temperature, presence: true
  validates :datetime, presence: true

  scope :current, -> { order(datetime: :desc).first }
  scope :historical, -> { order(datetime: :desc).limit(24) }
  scope :last_24_hours, -> { where(datetime: (Time.zone.now.to_i - (60 * 60 * 24))..Time.zone.now.to_i) }
  scope :min_temperature, -> { last_24_hours.order(temperature: :asc).first }
  scope :max_temperature, -> { last_24_hours.order(temperature: :desc).first }
  scope :avg_temperature, -> { last_24_hours.average(:temperature).floor(1) }
  scope :by_time, ->(input_time) { order(Arel::Nodes::SqlLiteral.new("ABS(datetime - #{input_time}) ASC")).first }
end
