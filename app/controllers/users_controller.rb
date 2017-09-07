# frozen_string_literal: true

class UsersController < ApplicationController

  include API::V1::RespondWith
  include Docs::UsersController

  before_action :authenticate, except: [:create]
  # before_action :set_user, only: %i[show update destroy]

  #
  # GET /users
  #
  # @return [type] [description]
  def index
    user_response = API::V1::Users.index
    respond_with user_response.body
    # respond_with API::V1::Users.index
  end

  #
  # POST /users
  #
  # @return [type] [description]
  def create
    user_response = API::V1::Users.create params.as_json
    respond_with user_response.body, user_response.code
    # respond_with API::V1::Users.create(params.as_json)
  end

  #
  # GET /users/:id
  #
  # @return [type] [description]
  def show
    user_response = API::V1::Users.show params[:id]
    respond_with user_response.body, user_response.code
    # respond_with API::V1::Users.show(params[:id])
  end

  #
  # PUT /users/:id
  #
  # @return [type] [description]
  def update
    user_response = API::V1::Users.update params[:id], params.as_json
    respond_with user_response.body, user_response.code
    # respond_with API::V1::Users.update(params[:id], params.as_json)
  end

  #
  # DELETE /users/:id
  #
  # @return [type] [description]
  def destroy
    user_response = API::V1::Users.destroy params[:id]
    respond_with user_response.body, user_response.code
    # respond_with API::V1::Users.destroy(params[:id])
  end

  private

  #
  # [set_user description]
  #
  # @return [type] [description]
  # def set_user
  #   user_response = API::V1::Users.show params[:id]
  #   decoded_user = ActiveSupport::JSON.decode user_response.body
  #   user = HashWithIndifferentAccess.new decoded_user
  #   @user = User.new user[:data][:attributes]
  # end

  #
  # [user_params description]
  #
  # @return [type] [description]
  # def user_params
  #   params.require(:user)
  # end
end
