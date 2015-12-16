 require 'test_helper'

class UserCanViewAlbumsTest < ActionDispatch::IntegrationTest
  test "user can see albums" do
    stub_omniauth
    VCR.use_cassette("flickr_service#albums", :allow_playback_repeats => true) do
      visit "/"
      click_link "login"
      click_link "Albums"
      assert page.has_css?("#album_1")
    end
  end

  test "user can see album photos" do
    stub_omniauth
    stub_album_photos
    VCR.use_cassette("flickr_service#albums", :allow_playback_repeats => true) do
      visit "/"
      click_link "login"
      click_link "Albums"
      assert page.has_css?("#album_1")
      click_link "album_link_1"
      assert page.has_css?("#album_photo_1")
    end
  end
end
