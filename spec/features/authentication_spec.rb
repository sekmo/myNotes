require "rails_helper"

describe "The authentication should work correctly" do
  before do
    @user = create(:user, email: "test@example.org", password: "123456")
  end

  it "welcomes you to after a successfully login" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: "test@example.org"
    fill_in "Password", with: "123456"
    click_on "Log in"
    expect(page).to have_content("Signed in successfully")
  end

  it "denies access with wrong credentials" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: "test@example.org"
    fill_in "Password", with: "222222222"
    click_on "Log in"
    expect(page).to have_content("Invalid Email or password")
  end
end
