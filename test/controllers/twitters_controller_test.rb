require 'test_helper'

class TwittersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twitters_index_url
    assert_response :success
  end

  test "should get show" do
    get twitters_show_url
    assert_response :success
  end

  test "should get new" do
    get twitters_new_url
    assert_response :success
  end

  test "should get edit" do
    get twitters_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get twitters_destroy_url
    assert_response :success
  end

end
