require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get landing_page_top_url
    assert_response :success
  end

end
