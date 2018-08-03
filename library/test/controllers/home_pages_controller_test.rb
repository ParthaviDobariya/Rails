require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home_page" do
    get home_pages_home_page_url
    assert_response :success
  end

end
