# frozen_string_literal: true

module API
  module V1
    class Comments
      include HTTParty

      base_uri "#{ENV['COMMENTS_API']}/v1"

      def self.index(user_id, options = {})
        options[:query] ||= {}
        options[:query][:user_id] = user_id
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
      end

      def self.destroy(id, options = {})
        delete "/#{id}", options
      end
    end
  end
end
