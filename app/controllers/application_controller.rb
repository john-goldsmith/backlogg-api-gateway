# frozen_string_literal: true

class ApplicationController < ActionController::API

  include Docs::ApplicationController

  # before_action :authenticate
  # attr_reader :current_user

  # def index
  #  This action is intentionally blank to disable WelcomeController#index and force a JSON 404 response
  # end

  def logged_in?
    !!current_user
  end

  def current_user
    # TODO: Is this memoization correct?
    # if @current_user
      # return @current_user
    # end
    if auth_present?
      user_id = decoded_jwt[:data][:payload][:id]
      # if !user_id ...
      user_response = API::V1::Users.show user_id
      if user_response.success?
        # ||= ?
        # @current_user = HashWithIndifferentAccess.new(user_response.parsed_response)
        return HashWithIndifferentAccess.new(user_response.parsed_response)
      end
    end
  end

  def authenticate
    json = {
      errors: [
        detail: "Unauthorized",
        status: 401
      ]
    }
    render(json: json, status: 401) unless logged_in?
  end

  private

  def auth_header
    request.headers['Authorization']
  end

  def jwt
    auth_header.scan(/^Bearer (.*)$/).flatten.last
  end

  def decoded_jwt
    auth_response = API::V1::Auth.decode({jwt: jwt})
    HashWithIndifferentAccess.new(auth_response.parsed_response)
  end

  def has_auth_header?
    request.headers['Authorization'].present?
  end

  def has_bearer?
    !!auth_header.scan(/^Bearer/).flatten.first
  end

  def auth_present?
    has_auth_header? && has_bearer?
  end
end
