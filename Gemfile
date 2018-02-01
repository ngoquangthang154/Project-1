source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "faker"
gem "jquery-rails"
gem "bootstrap-sass", "3.3.7"
gem "ckeditor"
gem "bcrypt", "~> 3.1.7"
gem "carrierwave", "~> 0.10.0"
gem "mini_magick", "~> 4.3"
gem "config"
gem "kaminari"
gem "ransack"
gem "bootstrap-kaminari-views"
gem "i18n-js"
gem "sqlite3"
gem "font-awesome-rails"
gem "jquery-turbolinks"
gem "flag-icons-rails"
gem "bootstrap-select-rails"
gem "bootstrap-slider-rails"

gem "kaminari"
gem "ransack"
gem "bootstrap-kaminari-views"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
