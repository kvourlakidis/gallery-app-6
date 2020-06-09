require "application_system_test_case"

class ArtworkPartsTest < ApplicationSystemTestCase
  setup do
    @artwork_part = artwork_parts(:one)
  end

  test "visiting the index" do
    visit artwork_parts_url
    assert_selector "h1", text: "Artwork Parts"
  end

  test "creating a Artwork part" do
    visit artwork_parts_url
    click_on "New Artwork Part"

    fill_in "Artwork", with: @artwork_part.artwork_id
    fill_in "Text", with: @artwork_part.text
    click_on "Create Artwork part"

    assert_text "Artwork part was successfully created"
    click_on "Back"
  end

  test "updating a Artwork part" do
    visit artwork_parts_url
    click_on "Edit", match: :first

    fill_in "Artwork", with: @artwork_part.artwork_id
    fill_in "Text", with: @artwork_part.text
    click_on "Update Artwork part"

    assert_text "Artwork part was successfully updated"
    click_on "Back"
  end

  test "destroying a Artwork part" do
    visit artwork_parts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artwork part was successfully destroyed"
  end
end
