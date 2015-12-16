require 'test_helper'

class UserCanLoginWithOAuthTest < ActionDispatch::IntegrationTest
  test "logging in" do
    stub_omniauth
    VCR.use_cassette("flickr_service#login") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal "/", current_path
      assert page.has_content?("ross_edfort")
      assert page.has_link?("Logout")
    end
  end
end
