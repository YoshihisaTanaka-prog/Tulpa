require "application_system_test_case"

class UserInfosTest < ApplicationSystemTestCase
  setup do
    @user_info = user_infos(:one)
  end

  test "visiting the index" do
    visit user_infos_url
    assert_selector "h1", text: "User infos"
  end

  test "should create user info" do
    visit user_infos_url
    click_on "New user info"

    check "Is main" if @user_info.is_main
    check "Is need meal" if @user_info.is_need_meal
    check "Is need sleep" if @user_info.is_need_sleep
    fill_in "Name", with: @user_info.name
    fill_in "User", with: @user_info.user_id
    click_on "Create User info"

    assert_text "User info was successfully created"
    click_on "Back"
  end

  test "should update User info" do
    visit user_info_url(@user_info)
    click_on "Edit this user info", match: :first

    check "Is main" if @user_info.is_main
    check "Is need meal" if @user_info.is_need_meal
    check "Is need sleep" if @user_info.is_need_sleep
    fill_in "Name", with: @user_info.name
    fill_in "User", with: @user_info.user_id
    click_on "Update User info"

    assert_text "User info was successfully updated"
    click_on "Back"
  end

  test "should destroy User info" do
    visit user_info_url(@user_info)
    click_on "Destroy this user info", match: :first

    assert_text "User info was successfully destroyed"
  end
end
