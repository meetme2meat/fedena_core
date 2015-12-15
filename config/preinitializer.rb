begin
  require "rubygems"
  require 'bundler'
  gem 'i18n', "~> 0.4.0"
rescue LoadError
  puts 'Fedena requires i18n gem version 0.4.0 to be installed.Run gem install i18n -v 0.4.0'
end

if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.24")
  raise RuntimeError, "Your bundler version is too old for Rails 2.3.\n" +
  "Run `gem install bundler` to upgrade."
end

begin
  # Set up load paths for all bundled gems
 ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)
 Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems.\n" +
    "Did you run `bundle install`?"
end

