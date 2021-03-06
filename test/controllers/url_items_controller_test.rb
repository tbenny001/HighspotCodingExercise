require "test_helper"

class UrlItemsControllerTest < ActionDispatch::IntegrationTest
  #create action
  test "should create a url item with the required fields with a success message" do
    expected_success_message = "Url Item successfully created"
    test_url = "http://test.com"
    test_name = "foo"
    test_folder_id = Folder.first.id

    assert_empty UrlItem.where(url: test_url, name: test_name, folder_id: test_folder_id)
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id }

    result = UrlItem.where(url: test_url, name: test_name, folder_id: test_folder_id).first

    assert_response :success
    assert_match expected_success_message, JSON.parse(response.body)["message"]
    assert_equal [test_url, test_name, test_folder_id], [result.url, result.name, result.folder_id] 
  end

  test "should create a url_item_tags when tags are supplied" do
    test_url = "http://test.com"
    test_name = "foo"
    test_folder_id = Folder.first.id
    test_tags = ["baz", "bar"]
    tag1 = Tag.create(name: test_tags.first)
    tag2 = Tag.create(name: test_tags.last)

    assert_empty UrlItemTag.where(tag_id: [tag1.id, tag2.id])
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id, tags: test_tags }

    assert_response :success
    assert UrlItemTag.where(tag_id: [tag1.id, tag2.id])
  end

  test "should return an error message if the provided folder id is invalid" do
    expected_error = "Invalid parameter passed. Please try again"
    test_url = "http://test.com"
    test_name = "foo"
    test_folder_id = 0
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id }

    assert_response :bad_request
    assert_match expected_error, response.body.to_s
  end

  test "should return an error message if any of the provided tags are invalid" do
    expected_error = "Invalid parameter passed. Please try again"
    test_url = "http://test.com"
    test_name = "foo"
    test_folder_id = Folder.first.id
    test_tags = ["small", "large", "cute"]
    
    post url_item_creation_path, params: { url: test_url, name: test_name, folder_id: test_folder_id, tags: test_tags }

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

  #search action
  test "should return all url items when queried by name" do
    test_name = "foo"
    test_item1 = UrlItem.create(url: "http://test.com", name: test_name, folder_id: Folder.first.id)
    test_item2 = UrlItem.create(url: "http://test2.com", name: test_name, folder_id: Folder.second.id)
    
    post url_item_search_path, params: { name: test_name }

    assert_response :success
    response_body = JSON.parse(response.body)
    result = UrlItem.find(response_body.map{|i| i["id"]})
    assert_equal [test_item1, test_item2], result
  end

  test "should filter url items when queried by name and a folder is provided" do
    test_name = "foo"
    test_item1 = UrlItem.create(url: "http://test.com", name: test_name, folder_id: Folder.first.id)
    test_item2 = UrlItem.create(url: "http://test2.com", name: test_name, folder_id: Folder.second.id)
    
    post url_item_search_path, params: { name: test_name, folder_id: Folder.first.id }

    assert_response :success
    response_body = JSON.parse(response.body)
    result = UrlItem.find(response_body.map{|i| i["id"]})
    assert_equal [test_item1], result
  end

  test "should filter url items when queried by name and tags are provided" do
    tag1 = Tag.create(name: "bar")
    tag2 = Tag.create(name: "baz")

    test_name = "foo"
    test_item1 = UrlItem.create(url: "http://test.com", name: test_name, folder_id: Folder.first.id, tags: [tag1])
    test_item2 = UrlItem.create(url: "http://test2.com", name: test_name, folder_id: Folder.second.id, tags: [tag2])
    
    post url_item_search_path, params: { name: test_name, tags: [tag1.name] }

    assert_response :success
    response_body = JSON.parse(response.body)
    result = UrlItem.find(response_body.map{|i| i["id"]})
    assert_equal [test_item1], result
  end

  test "should return an empty response if name is not valid" do
    test_name = "foo"
    test_item1 = UrlItem.create(url: "http://test.com", name: test_name, folder_id: Folder.first.id)
    test_item2 = UrlItem.create(url: "http://test2.com", name: test_name, folder_id: Folder.second.id)
    
    post url_item_search_path, params: { name: "invalid_name", folder_id: Folder.first.id }

    assert_response :success
    response_body = JSON.parse(response.body)
    result = UrlItem.find(response_body.map{|i| i["id"]})
    assert_equal [], result
  end
end
