require 'test_helper'

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get book_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get book_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get book_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get book_comments_destroy_url
    assert_response :success
  end

  test "should get show" do
    get book_comments_show_url
    assert_response :success
  end

end
