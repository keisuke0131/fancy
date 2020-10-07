require 'test_helper'

class ChangePasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get change_password_edit_url
    assert_response :success
  end

  test "should get update" do
    get change_password_update_url
    assert_response :success
  end

end
