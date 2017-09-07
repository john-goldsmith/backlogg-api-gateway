# module V1

#   module Concerns

    module Docs

      module AuthController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_path '/auth' do

            operation :post do
              key :summary, 'Authenticate a user'
              key :description, 'Authenticate and return the user'
              key :operationId, 'authenticateUser'
              key :tags, [
                'auth'
              ]
              parameter do
                key :name, :user
                key :in, :body
                key :description, 'User authentication request body'
                key :required, true
                schema do
                  key :'$ref', :AuthenticateUserParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 400 do
                key :description, 'Bad request'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

        end

      end

    end

#   end

# end