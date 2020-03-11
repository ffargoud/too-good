require 'test_helper'

class OrderBasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_baskets_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_baskets_destroy_url
    assert_response :success
  end

end
