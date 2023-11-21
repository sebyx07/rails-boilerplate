# frozen_string_literal: true

require 'etc'

available_cpus = Etc.nprocessors / 4
available_cpus = [ available_cpus, 2 ].max

max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { available_cpus * 5 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'

port ENV.fetch('PORT') { 3000 }

environment ENV.fetch('RAILS_ENV') { 'development' }

pidfile ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }

workers ENV.fetch('WEB_CONCURRENCY') { available_cpus }

plugin :tmp_restart
