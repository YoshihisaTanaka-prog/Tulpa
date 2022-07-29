require "test_helper"

class AnglesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @angle = angles(:one)
  end

  test "should get index" do
    get angles_url
    assert_response :success
  end

  test "should get new" do
    get new_angle_url
    assert_response :success
  end

  test "should create angle" do
    assert_difference("Angle.count") do
      post angles_url, params: { angle: { name: @angle.name } }
    end

    assert_redirected_to angle_url(Angle.last)
  end

  test "should show angle" do
    get angle_url(@angle)
    assert_response :success
  end

  test "should get edit" do
    get edit_angle_url(@angle)
    assert_response :success
  end

  test "should update angle" do
    patch angle_url(@angle), params: { angle: { name: @angle.name } }
    assert_redirected_to angle_url(@angle)
  end

  test "should destroy angle" do
    assert_difference("Angle.count", -1) do
      delete angle_url(@angle)
    end

    assert_redirected_to angles_url
  end
end
