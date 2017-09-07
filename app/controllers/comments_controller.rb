# frozen_string_literal: true

class CommentsController < ApplicationController

  include API::V1::RespondWith
  include Docs::CommentsController

  # before_action :set_comment, only: %i[show update destroy]
  before_action :authenticate

  #
  # GET /users/:user_id/comments
  #
  # @return [type] [description]
  def index
    comments_response = API::V1::Comments.index params[:user_id]
    respond_with comments_response.body
    # respond_with API::V1::Comments.index params[:user_id]
  end

  #
  # POST /comments
  #
  # @return [type] [description]
  def create
    comments_response = API::V1::Comments.create params.as_json
    respond_with comments_response.body, comments_response.code
    # respond_with API::V1::Comments.create params.as_json
  end

  #
  # GET /comments/:id
  #
  # @return [type] [description]
  def show
    comments_response = API::V1::Comments.show params[:id]
    respond_with comments_response.body, comments_response.code
    # respond_with API::V1::Comments.show params[:id]
  end

  #
  # PUT /comments/:id
  #
  # @return [type] [description]
  def update
    comments_response = API::V1::Comments.update params[:id], params.as_json
    respond_with comments_response.body, comments_response.code
    # respond_with API::V1::Comments.update params[:id], params.as_json
  end

  #
  # DELETE /comments/:id
  #
  # @return [type] [description]
  def destroy
    comments_response = API::V1::Comments.destroy params[:id]
    respond_with comments_response.body, comments_response.code
    # respond_with API::V1::Comments.destroy params[:id]
  end

  private

  #
  # [set_comment description]
  #
  # @return [type] [description]
  # def set_comment
  #   comment_response = API::V1::Comments.show params[:id]
  #   decoded_comment = ActiveSupport::JSON.decode comment_response.body
  #   comment = HashWithIndifferentAccess.new decoded_comment
  #   @comment = Comment.new comment[:data][:attributes]
  # end

  #
  # [set_user description]
  #
  # @return [type] [description]
  # def set_user
  #   user_response = API::Users.show params[:user_id]
  #   decoded_user = ActiveSupport::JSON.decode user_response.body
  #   user = HashWithIndifferentAccess.new decoded_user
  #   @user = Comment.new user[:data][:attributes]
  # end

  #
  # [comment_params description]
  #
  # @return [type] [description]
  # def comment_params
  #   params.require(:comment)
  # end
end
