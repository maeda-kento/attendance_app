require 'test_helper'

class Managers::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get managers_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get managers_sessions_create_url
    assert_response :success
  end

end
