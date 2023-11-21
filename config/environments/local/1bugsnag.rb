# frozen_string_literal: true

# mock Bugnsag

class Bugsnag
  def self.notify(e, opts = {})
    puts "Bugsnag.notify: #{e.inspect}"
  end
end
