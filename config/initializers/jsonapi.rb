# frozen_string_literal: true

JSONAPI.configure do |config|
  config.json_key_format = :camelized_key
  config.warn_on_missing_routes = false

  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count
  config.default_paginator = :paged
end
