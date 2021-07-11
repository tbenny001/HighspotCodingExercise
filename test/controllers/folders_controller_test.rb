require "test_helper"

class FoldersControllerTest < ActionDispatch::IntegrationTest
  FIXTURE_MODEL_COUNT = 2

  test "should return all folders" do
    get folders_index_path

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal FIXTURE_MODEL_COUNT, response_body.length
  end

  test "should create a folder with a unique name" do
    test_name = "foo"
    assert_nil Folder.find_by(name: "foo")
    
    post folder_creation_path, params: { name: test_name }

    assert_response :success
    assert Folder.find_by(name: "foo")
  end
end
