source 'https://rubygems.org'

gem 'rails', '4.1.8'

gem 'compass-rails'
gem 'sass-rails', '4.0.5'
gem 'bootstrap-sass', '3.1.1.0'
gem 'uglifier', '>= 1.3.0', group: [:deployment]
gem 'yui-compressor', group: [:deployment]

gem 'jquery-rails'

gem 'redis-objects'
gem 'easy_config'
gem 'slim', require: 'slim/logic_less'
gem 'draper'
gem 'request_store', '1.0.5'
gem 'em-http-request'
gem 'sanitize', '2.1.0'
gem 'font-awesome-sass', '4.3.2.1'
gem 'rack-cors', :require => 'rack/cors'
gem 'rack-rewrite'
gem 'utf8-cleaner'
gem 'kaminari'
gem 'google-api-client'
gem 'secure_headers'
gem 'mobvious'
gem 'pusher'

gem 'hiera'
gem 'hiera-redis'
gem 'traceview'
gem 'newrelic_rpm'

gem 'rails-tagged-syslog'


group :doc do
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'byebug'
  gem 'rspec-rails', '~> 2.14'
  gem 'brakeman-min'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'headless'
  gem 'vcr'
  gem 'webmock', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'metric_fu'
  gem 'ci_reporter', '~> 1.9.1'
  gem 'mock_redis', require: false
  gem 'teaspoon'
  gem 'quiet_assets'
  gem 'timecop'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec', '1.0.2'
  gem 'rb-fsevent'
  gem 'unicorn-rails'
end

group :devops do
  gem 'librarian-puppet'
  gem 'puppet', '~> 3.0'
  gem 'puppet-lint'
end

gem "step-up", "~> 0.9.6", group: [:preparing]
