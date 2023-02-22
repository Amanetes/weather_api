# frozen_string_literal: true

require 'socket'

module IpFinder
  class << self
    def find_ip
      ip_address = Socket.ip_address_list.find { |addr| addr.ipv4? && !addr.ipv4_loopback? }
      return '8.8.8.8' if ip_address.nil?

      ip_address.ip_address
    end
  end
end
