require 'test_helper'

class UserCanEditProfileTest < ActionDispatch::IntegrationTest
  test "user can edit profile" do
    stub_omniauth
    VCR.use_cassette("flickr_service#user") do
      visit "/"
      click_link "login"
      click_link "Settings"
      fill_in "Name", with: "Ross Edfortlieber"
      fill_in "User name", with: "ross_edfort"
      click_button "Update"
      assert_equal current_path, root_path
    end
  end
end
