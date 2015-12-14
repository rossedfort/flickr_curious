require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "logging out" do
    visit "/"
    click_link "login"
    assert page.has_link?("logout")
    click_link "logout"
    refute page.has_content?("Ross Edfort")
  end
end
