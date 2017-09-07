# frozen_string_literal: true

APIS = YAML.load_file(Rails.root.join('config', 'api.yml'))[Rails.env]

APIS.each do |api, options|
  http_module = options['protocol'].downcase == 'http' ? 'HTTP' : 'HTTPS'
  uri_module = "URI::#{http_module}".constantize
  host = options['host']
  port = options['port']
  path = options['path']
  ENV["#{api.upcase}_API"] = uri_module.build(host: host, port: port, path: path).to_s
end
