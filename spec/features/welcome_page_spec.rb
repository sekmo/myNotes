require "rails_helper"

describe "The app should welcome unlogged users with its philosophy" do
  it "should explain that writing down your thoughts is a healthy practice" do
    visit root_path
    expect(page).to have_content("It's scientifically proved that writing down your personal thoughts leads to great physical and mental improvements")
  end
end
