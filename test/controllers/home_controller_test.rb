require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    # sign_in users(:two)
  end

  test "redirect if not logged in" do
    # sign_out users(:two)
    # get home_index_url
    # assert_response :redirect
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end
end
