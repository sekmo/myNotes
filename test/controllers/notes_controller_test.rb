require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @note = FactoryGirl.create(:note)
    @user = FactoryGirl.create(:user)
  end

  test "should create note" do
    sign_in @user
    assert_difference('Note.count') do
      post notes_url, params: { note: { title: @note.title, date: @note.date, content: @note.content } }
    end
    assert_redirected_to notes_url
  end

  test "guests should get redirected to welcome#index when requesting notes#index" do
    get notes_url
    assert_redirected_to welcome_url
  end
end
