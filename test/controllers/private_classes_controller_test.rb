require "test_helper"

class PrivateClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_class = private_classes(:one) # Assuming this fixture exists
    @valid_params = {
      private_class: {
        gym_staff_id: 1, # Update IDs to match your fixture data
        gym_member_id: 1,
        date: "2024-12-01",
        time: "10:00 AM"
      }
    }
  end

  test "should get index" do
    get private_class_index_path # Correct route helper for "Private Classes Index"
    assert_response :success
  end

  test "should get new" do
    get new_private_class_path # Ensure this matches the routes
    assert_response :success
  end

  test "should create private class" do
    assert_difference('PrivateClass.count', 1) do
      post private_class_index_path, params: @valid_params
    end
    assert_redirected_to private_class_index_path
  end

  test "should show private class" do
    get private_class_path(@private_class) # Show helper
    assert_response :success
  end

  test "should get edit" do
    get edit_private_class_path(@private_class) # Edit helper
    assert_response :success
  end

  test "should update private class" do
    patch private_class_path(@private_class), params: { private_class: { time: "11:00 AM" } }
    assert_redirected_to private_class_index_path
  end

  test "should destroy private class" do
    assert_difference('PrivateClass.count', -1) do
      delete private_class_path(@private_class) # Destroy helper
    end
    assert_redirected_to private_class_index_path
  end
end
