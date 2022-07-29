require "test_helper"

class TulpaUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tulpa_user = tulpa_users(:one)
  end

  test "should get index" do
    get tulpa_users_url
    assert_response :success
  end

  test "should get new" do
    get new_tulpa_user_url
    assert_response :success
  end

  test "should create tulpa_user" do
    assert_difference("TulpaUser.count") do
      post tulpa_users_url, params: { tulpa_user: { user_id: @tulpa_user.user_id } }
    end

    assert_redirected_to tulpa_user_url(TulpaUser.last)
  end

  test "should show tulpa_user" do
    get tulpa_user_url(@tulpa_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_tulpa_user_url(@tulpa_user)
    assert_response :success
  end

  test "should update tulpa_user" do
    patch tulpa_user_url(@tulpa_user), params: { tulpa_user: { user_id: @tulpa_user.user_id } }
    assert_redirected_to tulpa_user_url(@tulpa_user)
  end

  test "should destroy tulpa_user" do
    assert_difference("TulpaUser.count", -1) do
      delete tulpa_user_url(@tulpa_user)
    end

    assert_redirected_to tulpa_users_url
  end
end
