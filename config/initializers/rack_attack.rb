# frozen_string_literal: true

module Rack
  class Attack
    # Throttle all requests by IP (60rpm)
    # 300 requests / 5 minutes = 60 requests per minute (RPM)
    # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
    throttle('req/ip', limit: 300, period: 5.minutes, &:ip)
  end
end
