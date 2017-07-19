require "test_helper"

feature "The pagination should work correctly" do
  setup do #should run before each test case
    @user = FactoryGirl.create(:user, email: "test@example.org", password: "123456")
    visit root_path
    #use the devise helper in place of those lines
    click_on "Login"
    fill_in "Email", with: "test@example.org"
    fill_in "Password", with: "123456"
    click_on "Log in"
  end

   scenario "With 11 records we should see just 10 records on /notes" do
     FactoryGirl.create_list(:note, 10, user: @user, title: "One nice title")
     #FactoryGirl.create(:note, user: @user, title: "I should be on the second page!")
     visit root_path
     page.must_have_content "One nice title"
     page.wont_have_content "I should be on the second page!"
     #check for ten times the content for the title
     #clean the test db after each test
   end

   scenario "Clicking next will show the next page" do
     FactoryGirl.create_list(:note, 10, user: @user, title: "One nice title")
     FactoryGirl.create(:note, user: @user, title: "I should be on the second page!")
     visit root_path
     click_on "Next"
     page.wont_have_content "One nice title"
     page.must_have_content "I should be on the second page!"
   end
end
