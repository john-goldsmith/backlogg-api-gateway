# module V1

  # module Concerns

    module Docs

      module DocsController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_root do
            key :swagger, '2.0'
            info do
              key :version, '0.1.0'
              key :title, 'API Gateway Docs'
              key :description, 'The entry point for interacting with microservices.'
              key :termsOfService, 'http://backlogg.io/terms'
              contact do
                key :name, 'Backlogg Development Team <development@backlogg.io>'
              end
              license do
                key :name, 'MIT'
              end
            end
            tag do
              key :name, 'user'
              key :description, 'User operations'
              externalDocs do
                key :description, 'Backlogg Developer Documentation'
                key :url, 'https://developers.backlogg.io'
              end
            end
            tag do
              key :name, 'comment'
              key :description, 'Comment operations'
              externalDocs do
                key :description, 'Backlogg Developer Documentation'
                key :url, 'https://developers.backlogg.io'
              end
            end
            tag do
              key :name, 'auth'
              key :description, 'Auth operations'
              externalDocs do
                key :description, 'Backlogg Developer Documentation'
                key :url, 'https://developers.backlogg.io'
              end
            end
            key :host, 'api.backlogg.dev:3000'
            key :basePath, '/'
            key :consumes, ['application/json']
            key :produces, ['application/vnd.api+json']
            key :schemes, ['https']
          end

          # A list of all classes that have swagger_* declarations.
          SWAGGERED_CLASSES = [
            ::ApplicationController,
            ::AuthController,
            ::CommentsController,
            ::UsersController,
            ::Comment,
            ::User,
            self
          ].freeze

          def index
            render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
          end

        end

      end

    end

#   end

# end