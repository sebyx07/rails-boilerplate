# frozen_string_literal: true

User.find_or_initialize_by(email: 'user').tap do |u|
  next if u.persisted?

  u.password = 'user'
  u.save(validate: false)
end
