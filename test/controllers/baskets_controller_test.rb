require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get baskets_index_url
    assert_response :success
  end

  test "should get show" do
    get baskets_show_url
    assert_response :success
  end

  test "should get new" do
    get baskets_new_url
    assert_response :success
  end

  test "should get create" do
    get baskets_create_url
    assert_response :success
  end

  test "should get edit" do
    get baskets_edit_url
    assert_response :success
  end

  test "should get update" do
    get baskets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get baskets_destroy_url
    assert_response :success
  end

end
