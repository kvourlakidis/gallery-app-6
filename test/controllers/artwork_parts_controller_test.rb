require 'test_helper'

class ArtworkPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artwork_part = artwork_parts(:one)
  end

  test "should get index" do
    get artwork_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_artwork_part_url
    assert_response :success
  end

  test "should create artwork_part" do
    assert_difference('ArtworkPart.count') do
      post artwork_parts_url, params: { artwork_part: { artwork_id: @artwork_part.artwork_id, text: @artwork_part.text } }
    end

    assert_redirected_to artwork_part_url(ArtworkPart.last)
  end

  test "should show artwork_part" do
    get artwork_part_url(@artwork_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_artwork_part_url(@artwork_part)
    assert_response :success
  end

  test "should update artwork_part" do
    patch artwork_part_url(@artwork_part), params: { artwork_part: { artwork_id: @artwork_part.artwork_id, text: @artwork_part.text } }
    assert_redirected_to artwork_part_url(@artwork_part)
  end

  test "should destroy artwork_part" do
    assert_difference('ArtworkPart.count', -1) do
      delete artwork_part_url(@artwork_part)
    end

    assert_redirected_to artwork_parts_url
  end
end
