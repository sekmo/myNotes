require "test_helper"

feature "Authentication should work" do
   scenario "Inserting a valid user/password combination we should get " do
     visit new_user_session
     #we expect to see just 10 records
     #page.must_have_content "Hello World"
     #page.wont_have_content "Goodbye All!"
   end
end
