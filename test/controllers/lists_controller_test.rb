require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lists_index_url
    assert_response :success
  end

  test "should get show" do
    get lists_show_url
    assert_response :success
  end

  test "should get new" do
    get lists_new_url
    assert_response :success
  end

  test "should get create" do
    get lists_create_url
    assert_response :success
  end
end
