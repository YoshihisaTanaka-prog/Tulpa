require "application_system_test_case"

class TulpaUsersTest < ApplicationSystemTestCase
  setup do
    @tulpa_user = tulpa_users(:one)
  end

  test "visiting the index" do
    visit tulpa_users_url
    assert_selector "h1", text: "Tulpa users"
  end

  test "should create tulpa user" do
    visit tulpa_users_url
    click_on "New tulpa user"

    fill_in "User", with: @tulpa_user.user_id
    click_on "Create Tulpa user"

    assert_text "Tulpa user was successfully created"
    click_on "Back"
  end

  test "should update Tulpa user" do
    visit tulpa_user_url(@tulpa_user)
    click_on "Edit this tulpa user", match: :first

    fill_in "User", with: @tulpa_user.user_id
    click_on "Update Tulpa user"

    assert_text "Tulpa user was successfully updated"
    click_on "Back"
  end

  test "should destroy Tulpa user" do
    visit tulpa_user_url(@tulpa_user)
    click_on "Destroy this tulpa user", match: :first

    assert_text "Tulpa user was successfully destroyed"
  end
end
