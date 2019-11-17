require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get tops_home_url
    assert_response :success
  end

  test "should get about" do
    get tops_about_url
    assert_response :success
  end

end
