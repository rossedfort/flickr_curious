require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "logging out" do
    stub_omniauth
    VCR.use_cassette("flickr_service#logout") do
      visit "/"
      click_link "login"
      assert page.has_link?("Logout")
      click_link "Logout"
      refute page.has_content?("Ross Edfort")
    end
  end
end
