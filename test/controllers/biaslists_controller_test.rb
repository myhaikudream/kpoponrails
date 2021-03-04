require "test_helper"

class BiaslistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get biaslists_index_url
    assert_response :success
  end

  test "should get show" do
    get biaslists_show_url
    assert_response :success
  end

  test "should get edit" do
    get biaslists_edit_url
    assert_response :success
  end
end
