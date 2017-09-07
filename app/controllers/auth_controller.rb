# frozen_string_literal: true

class AuthController < ApplicationController

  include API::V1::RespondWith
  include Docs::AuthController

  # skip_before_action :authenticate

  #
  # POST /auth
  #
  # @return [type] [description]
  def create
    user_response = API::V1::Users.authenticate params.as_json
    if user_response.success?
      json = HashWithIndifferentAccess.new(user_response.parsed_response)
      auth_response = API::V1::Auth.issue json[:data]
      respond_with auth_response.body, auth_response.code
    else
      respond_with nil, :unauthorized
    end
  end
end
