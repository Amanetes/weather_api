source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'awesome_print'
end

