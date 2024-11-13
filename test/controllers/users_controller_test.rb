require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get only:show" do
    get users_only:show_url
    assert_response :success
  end
end
