workers ENV.fetch('WEB_CONCURRENCY') { 2 }.to_i

threads_count = ENV.fetch('MAX_THREADS') { 5 }.to_i
threads threads_count, threads_count

rackup DefaultRackup
port ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RACK_ENV') { 'development' }
preload_app!