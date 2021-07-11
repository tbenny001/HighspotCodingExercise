require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  FIXTURE_MODEL_COUNT = 2

  test "should return all tags" do
    get tags_index_path

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal FIXTURE_MODEL_COUNT, response_body.length
  end

  test "should create a folder with a unique name" do
    test_name = "foo"
    assert_nil Tag.find_by(name: "foo")
    
    post tag_creation_path, params: { name: test_name }

    assert_response :success
    assert Tag.find_by(name: "foo")
  end
end
