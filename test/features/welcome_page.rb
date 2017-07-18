require "test_helper"

feature "The welcome controller should welcome you" do
   scenario "it should show Noteworthy personal notes" do
     #authenticate user
     visit root_path
     #we expect to see just 10 records
     page.must_have_content "Noteworthy personal notes."
     #page.wont_have_content "Goodbye All!"
   end
end
