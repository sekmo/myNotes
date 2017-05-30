require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @document = documents(:one)
    @user = users(:francesco)
  end
  # test "the truth" do
  #   assert true
  # end
  test "should create document" do
    sign_in @user
    assert_difference('Document.count') do
      post documents_url, params: { document: { title: @document.title, content: @document.content } }
    end
    assert_redirected_to documents_url
  end

  test "guests should get redirected to welcome#index when requesting documents#index" do
    get documents_url
    assert_redirected_to welcome_url
  end
end
