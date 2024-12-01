require "test_helper"

class GroupClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_class_index_path # Correct route helper for "Group Classes Index"
    assert_response :success
  end

  # Add more tests for group class actions as needed
end
