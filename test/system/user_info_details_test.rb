require "application_system_test_case"

class UserInfoDetailsTest < ApplicationSystemTestCase
  setup do
    @user_info_detail = user_info_details(:one)
  end

  test "visiting the index" do
    visit user_info_details_url
    assert_selector "h1", text: "User info details"
  end

  test "should create user info detail" do
    visit user_info_details_url
    click_on "New user info detail"

    fill_in "Category", with: @user_info_detail.category_id
    fill_in "Text", with: @user_info_detail.text
    fill_in "User info", with: @user_info_detail.user_info_id
    click_on "Create User info detail"

    assert_text "User info detail was successfully created"
    click_on "Back"
  end

  test "should update User info detail" do
    visit user_info_detail_url(@user_info_detail)
    click_on "Edit this user info detail", match: :first

    fill_in "Category", with: @user_info_detail.category_id
    fill_in "Text", with: @user_info_detail.text
    fill_in "User info", with: @user_info_detail.user_info_id
    click_on "Update User info detail"

    assert_text "User info detail was successfully updated"
    click_on "Back"
  end

  test "should destroy User info detail" do
    visit user_info_detail_url(@user_info_detail)
    click_on "Destroy this user info detail", match: :first

    assert_text "User info detail was successfully destroyed"
  end
end
