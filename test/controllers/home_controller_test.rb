require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path # Correct route helper for "Home"
    assert_response :success
  end

  test "should get about" do
    get about_path # Correct route helper for "About Us"
    assert_response :success
  end

  test "should get contact" do
    get contact_path # Correct route helper for "Contact Us"
    assert_response :success
  end
end
