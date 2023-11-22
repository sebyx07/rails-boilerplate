# frozen_string_literal: true

JSONAPI.configure do |config|
  config.json_key_format = :camelized_key
  config.warn_on_missing_routes = false
end
