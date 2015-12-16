ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/pride'
require 'simplecov'
require 'database_cleaner'
require 'webmock'
require 'vcr'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include Capybara::DSL
  SimpleCov.start("rails")
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
    # config.ignore_request do |request|
    #   p request
    #   request.uri == 'https://www.flickr.com/services/oauth/request_token'
    # end
  end

  def setup
    DatabaseCleaner.start
    Capybara.app = FlickrCurious::Application
  end

  def teardown
    DatabaseCleaner.clean
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:flickr] = OmniAuth::AuthHash.new({
      provider: 'flickr',
      uid: "45646189@N06",
      info: {
              name: "Ross Edfort",
              nickname: "ross_edfort"
            },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end
