# frozen_string_literal: true

class Comment < ApplicationModel
  include Docs::Comment

  # validates :body, presence: true
  attr_accessor :body,
                :user_id,
                :created_at,
                :updated_at
end
