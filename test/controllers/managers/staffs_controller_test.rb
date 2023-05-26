require 'test_helper'

class Managers::StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get managers_staffs_index_url
    assert_response :success
  end

end
