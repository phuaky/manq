require 'test_helper'

class BizUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get biz_users_index_url
    assert_response :success
  end

  test "should get show" do
    get biz_users_show_url
    assert_response :success
  end

  test "should get new" do
    get biz_users_new_url
    assert_response :success
  end

  test "should get create" do
    get biz_users_create_url
    assert_response :success
  end

  test "should get edit" do
    get biz_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get biz_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get biz_users_destroy_url
    assert_response :success
  end

end
