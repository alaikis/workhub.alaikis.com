require "test_helper"

class Home::IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_index_url
    assert_response :success
  end
end
