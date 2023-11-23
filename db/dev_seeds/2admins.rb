# frozen_string_literal: true

AdminUser.find_or_initialize_by(email: 'admin').tap do |u|
  next if u.persisted?

  u.password = 'admin'
  u.save(validate: false)
end
