require "test_helper"

feature "The pagination should work correctly" do
   scenario "With 11 records we should see just 10 records on /notes" do
     #authenticate user
     visit root_path
     #we expect to see just 10 records
     #page.must_have_content "Hello World"
     #page.wont_have_content "Goodbye All!"
   end

   scenario "With 11 records, clicking 'next' we should see just 1 record" do
     #authenticate user
     visit root_path
     #click "next" link inside nav.pagination
     #we expect a redirect
     #click the link inside div.note-index__note__content inside the first div.note-index__note of the page

     #we expect to see just 1 record
     #page.must_have_content "Hello World"
     #page.wont_have_content "Goodbye All!"
   end
end
