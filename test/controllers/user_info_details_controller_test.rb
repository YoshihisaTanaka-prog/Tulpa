require "test_helper"

class UserInfoDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_info_detail = user_info_details(:one)
  end

  test "should get index" do
    get user_info_details_url
    assert_response :success
  end

  test "should get new" do
    get new_user_info_detail_url
    assert_response :success
  end

  test "should create user_info_detail" do
    assert_difference("UserInfoDetail.count") do
      post user_info_details_url, params: { user_info_detail: { category_id: @user_info_detail.category_id, text: @user_info_detail.text, user_info_id: @user_info_detail.user_info_id } }
    end

    assert_redirected_to user_info_detail_url(UserInfoDetail.last)
  end

  test "should show user_info_detail" do
    get user_info_detail_url(@user_info_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_info_detail_url(@user_info_detail)
    assert_response :success
  end

  test "should update user_info_detail" do
    patch user_info_detail_url(@user_info_detail), params: { user_info_detail: { category_id: @user_info_detail.category_id, text: @user_info_detail.text, user_info_id: @user_info_detail.user_info_id } }
    assert_redirected_to user_info_detail_url(@user_info_detail)
  end

  test "should destroy user_info_detail" do
    assert_difference("UserInfoDetail.count", -1) do
      delete user_info_detail_url(@user_info_detail)
    end

    assert_redirected_to user_info_details_url
  end
end
