require "rails_helper"

describe "The pagination should work correctly" do
  before do
    @user = FactoryGirl.create(:user, email: "test@example.org", password: "123456")
    visit root_path
    login_as(@user, :scope => :user)

    # login with capybara
    # click_on "Login"
    # fill_in "Email", with: "test@example.org"
    # fill_in "Password", with: "123456"
    # click_on "Log in"
  end

  context "with 11 records" do
    before do
      FactoryGirl.create_list(:note, 10, user: @user, title: "One nice title")
      FactoryGirl.create(:note, user: @user, title: "I should be on the second page!")
    end

    it "should show just 10 records on /notes" do
      visit root_path
      expect(page).to have_content("One nice title")
      expect(page).to_not have_content("I should be on the second page!")
      #check for ten times the content for the title
      #clean the test db after each test
    end

    it "should show the next page when clicking 'next'" do
      visit root_path
      click_on "Next"
      expect(page).to_not have_content("One nice title")
      expect(page).to have_content("I should be on the second page!")
    end
  end
end
