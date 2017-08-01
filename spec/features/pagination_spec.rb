require "rails_helper"

describe "The pagination should work correctly" do
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  context "with 11 records" do
    before do
      create_list(:note, 10, user: @user, title: "One nice title")
      create(:note, user: @user, title: "I should be on the second page!")
    end

    it "shows just 10 records on /notes" do
      visit root_path
      expect(page).to have_content("One nice title")
      expect(page).to_not have_content("I should be on the second page!")
    end

    it "shows the next page when clicking 'next'" do
      visit root_path
      click_on "Next"
      expect(page).to_not have_content("One nice title")
      expect(page).to have_content("I should be on the second page!")
    end
  end
end
