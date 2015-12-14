ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/pride'
require 'simplecov'
require 'database_cleaner'

class ActiveSupport::TestCase
  include Capybara::DSL
  SimpleCov.start("rails")
  fixtures :all

  def setup
    DatabaseCleaner.start
    Capybara.app = FlickrCurious::Application
    stub_omniauth
  end

  def teardown
    DatabaseCleaner.clean
  end

  def stub_omniauth
      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:flickr] = OmniAuth::AuthHash.new({
        provider: 'flickr',
        extra: {
          raw_info: {
            user_id: "1234",
            name: "Horace",
            screen_name: "worace",
          }
        },
        credentials: {
          token: "pizza",
          secret: "secretpizza"
        }
      })
  end
end
