require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should get myaccount" do
    get users_myaccount_url
    assert_response :success
  end

  test "should get sign_up" do
    get users_sign_up_url
    assert_response :success
  end
end
