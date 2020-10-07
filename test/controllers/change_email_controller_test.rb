require 'test_helper'

class ChangeEmailControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get change_email_edit_url
    assert_response :success
  end

  test "should get update" do
    get change_email_update_url
    assert_response :success
  end

end
