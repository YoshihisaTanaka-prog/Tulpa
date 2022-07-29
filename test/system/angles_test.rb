require "application_system_test_case"

class AnglesTest < ApplicationSystemTestCase
  setup do
    @angle = angles(:one)
  end

  test "visiting the index" do
    visit angles_url
    assert_selector "h1", text: "Angles"
  end

  test "should create angle" do
    visit angles_url
    click_on "New angle"

    fill_in "Name", with: @angle.name
    click_on "Create Angle"

    assert_text "Angle was successfully created"
    click_on "Back"
  end

  test "should update Angle" do
    visit angle_url(@angle)
    click_on "Edit this angle", match: :first

    fill_in "Name", with: @angle.name
    click_on "Update Angle"

    assert_text "Angle was successfully updated"
    click_on "Back"
  end

  test "should destroy Angle" do
    visit angle_url(@angle)
    click_on "Destroy this angle", match: :first

    assert_text "Angle was successfully destroyed"
  end
end
