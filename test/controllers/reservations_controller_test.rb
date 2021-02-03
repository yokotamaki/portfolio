require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get reservations_search_url
    assert_response :success
  end

  test "should get confirm" do
    get reservations_confirm_url
    assert_response :success
  end

  test "should get success" do
    get reservations_success_url
    assert_response :success
  end

end
