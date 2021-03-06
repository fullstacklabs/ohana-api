source 'https://rubygems.org'

ruby '2.3.3'
gem 'active_model_serializers', '~> 0.8.0'
gem 'acts-as-taggable-on', '~> 5.0'
gem 'ancestry'
gem 'auto_strip_attributes', '~> 2.0'
gem 'bootstrap-sass', '~> 3.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'csv_shaper'
gem 'dalli'
gem 'devise', '~> 4.1'
gem 'dotenv-rails'
gem 'enumerize'
gem 'figaro', '~> 1.0'
gem 'friendly_id', '~> 5.0'
gem 'geocoder', '~> 1.5.1'
gem 'haml-rails'
gem 'jquery-rails', '~> 4.0'
gem 'kaminari'
gem 'kgio'
gem 'memcachier'
gem 'pg'
gem 'pg_search'
gem 'protected_attributes'
gem 'pry-byebug'
gem 'puma'
gem 'pundit'
gem 'rack-cache'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 4.2'
gem 'rubyzip'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails', '~> 3.5'
gem 'smarter_csv'
gem 'sucker_punch'
gem 'uglifier', '>= 1.3.0'
gem 'devise-jwt', '~> 0.5.8'
gem 'carrierwave' #for uploading blog images
gem 'fog-aws' #for uploading images
gem 'connection_pool' #for making puma play nicely wth memcachier
gem 'sendgrid-ruby' #for sending emails

group :production do
  # Heroku recommended
  gem 'rails_12factor'
end

group :test, :development do
  gem 'bullet'
  gem 'byebug'
  gem 'factory_girl_rails', '>= 4.2.0'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3.1'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'haml_lint'
  gem 'poltergeist'
  gem 'rubocop'
  gem 'shoulda-matchers', require: false
  gem 'test_after_commit'
  gem 'webmock'
end

group :development do
  gem 'better_errors', '>= 0.7.2'
  gem 'binding_of_caller', '>= 0.7.1', platforms: %i[mri_19 rbx]
  gem 'bummr'
  gem 'derailed'
  gem 'faker'
  gem 'flamegraph'
  gem 'letter_opener'
  gem 'quiet_assets', '>= 1.0.2'
  gem 'rack-mini-profiler'
  gem 'reek'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  gem 'stackprof'
end
