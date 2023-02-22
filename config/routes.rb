# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/v1/weather#current'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/current', to: 'weather#current'
      get '/health', to: 'weather#health'
      get '/by_time', to: 'weather#by_time'
      namespace :historical do
        get '/', to: 'weather#historical'
        get '/average', to: 'weather#average'
        get '/min', to: 'weather#min'
        get '/max', to: 'weather#max'
      end
    end
  end
  # Redirect to root path on catch-all route
  get '*path', to: redirect('/')
end
