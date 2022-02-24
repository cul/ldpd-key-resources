require "application_system_test_case"

class KeyResourcesTest < ApplicationSystemTestCase
  setup do
    @key_resource = key_resources(:one)
    @next_title = @key_resource.title.sub(/\sA$/, ' C')
    login_as_user(users(:authorized))
  end

  test "visiting the index" do
    visit key_resources_url
    assert_selector "h1", text: "Key Resources"
  end

  test "creating a Key Resource" do
    visit key_resources_url
    click_on "New Key Resource"

    fill_in "Description", with: @key_resource.description
    fill_in "Keywords", with: @key_resource.keywords
    fill_in "Contexts", with: @key_resource.contexts
    fill_in "Categories", with: @key_resource.categories
    fill_in "Title", with: @next_title
    fill_in "Url", with: @key_resource.url
    click_on "Save"

    assert_text "Key Resource was successfully created"
    assert_css("dd.key-resource-updated-by", text: users(:authorized).uid)
    click_on "View All Key Resources"
  end

  test "updating a Key Resource" do
    visit key_resources_url
    click_on "Edit", match: :first

    fill_in "Description", with: @key_resource.description
    fill_in "Keywords", with: @key_resource.keywords
    fill_in "Contexts", with: @key_resource.contexts
    fill_in "Categories", with: @key_resource.categories
    fill_in "Title", with: @key_resource.title
    fill_in "Url", with: @key_resource.url
    click_on "Save"

    assert_text "Key Resource was successfully updated"
    assert_css("dd.key-resource-updated-by", text: users(:authorized).uid)
    click_on "View All Key Resources"
  end

  test "destroying a Key Resource" do
    visit key_resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key Resource was successfully destroyed"
  end
end
