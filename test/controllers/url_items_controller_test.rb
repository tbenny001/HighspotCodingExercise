require "test_helper"

class UrlItemsControllerTest < ActionDispatch::IntegrationTest
  test "should create a url item with the required fields" do
    test_url = "http://test.com"
    test_name = "foo"
    test_folder_id = Folder.first.id

    assert_empty UrlItem.where(url: test_url, name: test_name, folder_id: test_folder_id)
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id }

    result = UrlItem.where(url: test_url, name: test_name, folder_id: test_folder_id).first

    assert_response :success
    assert_equal [test_url, test_name, test_folder_id], [result.url, result.name, result.folder_id] 
  end

  test "should return an error message if the provided folder id is invalid" do
    expected_error = "Invalid parameter passed. Please try again"
    test_url = "test.com"
    test_name = "foo"
    test_folder_id = 0
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id }

    assert_response :bad_request
    assert_match expected_error, response.body.to_s
  end

  test "should return an error message if the provided url is improperly formatted" do
    expected_error = "Invalid parameter passed. Please try again"
    test_url = "test_string"
    test_name = "foo"
    test_folder_id = Folder.first.id
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id }

    assert_response :bad_request
    assert_match expected_error, response.body.to_s
  end
end
