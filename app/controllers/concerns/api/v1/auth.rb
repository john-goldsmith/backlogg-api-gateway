# frozen_string_literal: true

module API
  module V1
    class Auth
      include HTTParty

      base_uri "#{ENV['AUTH_API']}/v1"

      def self.issue(body = {})
        post '/issue', body: body
      end

      def self.decode(body = {})
        post '/decode', body: body
      end

    end
  end
end
