require 'test_helper'

class FlickrServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = FlickrService.new
    @user = User.create!(name: 'Ross Edfort',
                        user_name: 'ross_edfort',
                        uid: '45646189@N06')
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
  end

  test "#get_photos_by_user" do
    VCR.use_cassette("flickr_service#get_photos_by_user") do
      photos = service.get_photos_by_user(@user.uid)
      assert_equal 12, photos.count
    end
  end
end
