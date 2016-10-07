require 'test_helper'

class QueuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queues_index_url
    assert_response :success
  end

  test "should get show" do
    get queues_show_url
    assert_response :success
  end

  test "should get new" do
    get queues_new_url
    assert_response :success
  end

  test "should get create" do
    get queues_create_url
    assert_response :success
  end

  test "should get edit" do
    get queues_edit_url
    assert_response :success
  end

  test "should get update" do
    get queues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get queues_destroy_url
    assert_response :success
  end

end
