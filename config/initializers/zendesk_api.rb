require 'zendesk_api'

credentials = YAML.load_file(Rails.root.to_s + '/config/zendesk_credentials.yml')

$client = ZendeskAPI::Client.new do |config|
  config.url = "https://#{credentials['subdomain']}.zendesk.com/api/v2"

  # Token Authentication
  config.username = credentials['username']
  config.token = credentials['token']

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = { :ssl => false }

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end
