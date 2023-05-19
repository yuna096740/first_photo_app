require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photos_index_url
    assert_response :success
  end

  test "should get show" do
    get photos_show_url
    assert_response :success
  end

  test "should get edit" do
    get photos_edit_url
    assert_response :success
  end
end
