require "test_helper"

class PrivateClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get private_classes_index_url
    assert_response :success
  end

  test "should get new" do
    get private_classes_new_url
    assert_response :success
  end

  test "should get create" do
    get private_classes_create_url
    assert_response :success
  end

  test "should get edit" do
    get private_classes_edit_url
    assert_response :success
  end

  test "should get update" do
    get private_classes_update_url
    assert_response :success
  end

  test "should get show" do
    get private_classes_show_url
    assert_response :success
  end

  test "should get destroy" do
    get private_classes_destroy_url
    assert_response :success
  end
end
