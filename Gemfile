source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "config"
gem "bcrypt", "3.1.12"
gem "bootstrap-sass"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "faker", :git => "https://github.com/stympy/faker.git", :branch => "master"
gem "font-awesome-sass"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick"
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "omniauth-github"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.7"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "3.1.6"
gem "will_paginate-bootstrap"
gem "chartkick"
gem "csv"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
