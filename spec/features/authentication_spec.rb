require "rails_helper"

describe "The authentication should work correctly" do
  before do
    @user = FactoryGirl.create(:user, email: "test@example.org", password: "123456")
  end

  # TODO: WRITE TEST FOR REDIRECT
  it "should redirect you to notes#index after a successfully login" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: "test@example.org"
    fill_in "Password", with: "123456"
    click_on "Log in"
    #expect(page).to have_http_status(:redirect)
    expect(page).to have_content("Welcome to MyNotes!")
  end
end
