# frozen_string_literal: true

ENV['REDIS_PATH'] ||= Rails.root.join('tmp', 'redis', 'redis.sock').to_s

redis_config = {
  path: ENV['REDIS_PATH'],
}

if Rails.env.production?
  redis_config[:driver] = :hiredis
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

if Sidekiq.server?
  Sidekiq.redis { |conn| conn.flushdb }
end

Sidekiq::Options[:cron_poll_interval] = 1

Sidekiq.configure_server do |config|
  config.on(:startup) do
    schedule_files = Dir.glob(Rails.root.join('config', 'schedule', '*.yml'))

    schedule_files << 'config/schedule.yml'

    next if schedule_files.empty?

    Sidekiq::Cron::Job.destroy_all!
    schedule_files.each do |schedule_file|
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end
