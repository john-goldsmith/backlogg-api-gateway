# frozen_string_literal: true

module API
  module V1
    module RespondWith
      extend ActiveSupport::Concern

      included do
        def respond_with(payload = {}, status = :ok)
          render json: payload, status: status
        end
      end
    end
  end
end
