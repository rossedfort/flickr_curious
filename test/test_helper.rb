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
      nsid: "45646189@N06",
      iconserver: "8792",
      iconfarm: "9",
      info: {
              name: "Ross Edfort",
              nickname: "ross_edfort"
            },
      credentials: {
        token: ENV['FLICKR_PUBLIC_KEY_PRO'],
        secret: "secretpizza"
      }
    })
  end

  def stub_album_photos
    FlickrService.any_instance.stubs(:get_album_photos).returns([
                                                                OpenStruct.new({"id"=>"16712094044", "secret"=>"1347f8a8d0", "server"=>"7671", "farm"=>8, "title"=>"", "isprimary"=>"0", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}),
                                                                OpenStruct.new({"id"=>"16902223214", "secret"=>"7654fa6e27", "server"=>"8694", "farm"=>9, "title"=>"", "isprimary"=>"0", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}),
                                                                OpenStruct.new({"id"=>"16904440203", "secret"=>"fbeca6833b", "server"=>"8888", "farm"=>9, "title"=>"", "isprimary"=>"0", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}),
                                                                OpenStruct.new({"id"=>"17336937248", "secret"=>"9d860271b0", "server"=>"7697", "farm"=>8, "title"=>"", "isprimary"=>"0", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0})]
                                                                 )
  end

  def stub_album_info
    FlickrService.any_instance.stubs(:get_album_info).returns(OpenStruct.new("title" => "title"))
  end

  def stub_views
    ApplicationController.any_instance.stubs(:views).returns(OpenStruct.new("views" => "20"))
  end
end
