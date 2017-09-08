# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers', '~> 0.10.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
gem 'rack-cors'
gem 'httparty'
gem 'aws-sdk-rails' # See http://docs.aws.amazon.com/sdk-for-ruby/v2/developer-guide/rails.html
gem 'swagger-blocks'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platform: :mri
  # See https://joanswork.com/rubocop-rails-getting-started/
  # See https://buildtoship.com/integrate-rubocop-in-your-workflow/
  # See http://monksealsoftware.com/add-rubocop-to-every-rails-project/
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in
  # the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
