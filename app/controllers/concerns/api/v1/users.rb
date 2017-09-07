# frozen_string_literal: true

module API
  module V1
    class Users
      include HTTParty

      base_uri "#{ENV['USERS_API']}/v1"

      def self.index(options = {})
        get '', options
      end

      def self.show(id, options = {})
        get "/#{id}", options
      end

      def self.create(body = {})
        post '', body: body
      end

      def self.update(id, body = {})
        put "/#{id}", body: body
        # put "/#{id}", body: { user: options }
      end

      def self.destroy(id, options = {})
        delete "/#{id}", options
      end

      def self.authenticate(body = {})
        post '/authenticate', body: body
      end
    end
  end
end
