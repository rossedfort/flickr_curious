require 'test_helper'

class UserCanViewPhotosTest < ActionDispatch::IntegrationTest
  test "user can see their photos" do
    stub_omniauth
    VCR.use_cassette("flickr_service#photos", :allow_playback_repeats => true) do
      visit "/"
      click_link "login"
      click_link "Photos"
      12.times do |i|
        assert page.has_css?("#photo_#{i}")
      end
    end
  end

  test "user can see an individual photo" do
    stub_omniauth
    VCR.use_cassette("flickr_service#photos", :allow_playback_repeats => true) do
      visit "/"
      click_link "login"
      click_link "Photos"
      click_link "photo_link_1"
      assert page.has_css?(".photo")
    end
  end
end
