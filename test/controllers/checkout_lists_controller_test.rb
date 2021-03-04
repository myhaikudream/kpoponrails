require "test_helper"

class CheckoutListsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get checkout_lists_edit_url
    assert_response :success
  end

  test "should get index" do
    get checkout_lists_index_url
    assert_response :success
  end

  test "should get new" do
    get checkout_lists_new_url
    assert_response :success
  end
end
