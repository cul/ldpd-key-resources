require 'test_helper'

class KeyResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_resource = key_resources(:one)
    @next_title = @key_resource.title.sub(/\sA$/, ' C')
    login_as_user(users(:authorized))
  end

  test "should get index" do
    get key_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_key_resource_url
    assert_response :success
  end

  test "should create key_resource" do
    assert_difference('KeyResource.count', 1) do
      post key_resources_url, params: { key_resource: { created_by: @key_resource.created_by, description: @key_resource.description, keywords: @key_resource.keywords, contexts: @key_resource.contexts, categories: @key_resource.categories, title: @next_title, updated_by: @key_resource.updated_by, url: @key_resource.url } }
    end

    assert_redirected_to key_resource_url(KeyResource.last)
  end

  test "should show key_resource" do
    get key_resource_url(@key_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_resource_url(@key_resource)
    assert_response :success
  end

  test "should update key_resource" do
    patch key_resource_url(@key_resource), params: { key_resource: { created_by: @key_resource.created_by, description: @key_resource.description, keywords: @key_resource.keywords, contexts: @key_resource.contexts, categories: @key_resource.categories, title: @key_resource.title, updated_by: @key_resource.updated_by, url: @key_resource.url } }
    assert_redirected_to key_resource_url(@key_resource)
  end

  test "should destroy key_resource" do
    assert_difference('KeyResource.count', -1) do
      delete key_resource_url(@key_resource)
    end

    assert_redirected_to key_resources_url
  end
end
