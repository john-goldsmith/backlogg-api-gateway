# frozen_string_literal: true

class User < ApplicationModel
  include Docs::User

  # validates :body, presence: true
  attr_accessor :email,
                :first_name,
                :last_name,
                :birthday,
                :created_at,
                :updated_at
end
