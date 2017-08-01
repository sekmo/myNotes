require "rails_helper"

describe Note do

  describe ".grouped_by_month" do
    let(:user) { create(:user) }
    before do
      create(:note, date: Date.new(2017, 7, 1), user: user)
      create(:note, date: Date.new(2017, 7, 4), user: user)
      create(:note, date: Date.new(2017, 8, 4), user: user)
      create(:note, date: Date.new(2016, 7, 4), user: user)
    end

    it "returns a hash grouped by the beginning of the month" do
      result = Note.grouped_by_month
      expect(result[ Date.new(2017,7,1) ].size).to eq(2)
      expect(result.keys).to eq([ Date.new(2017, 8, 1), Date.new(2017, 7, 1), Date.new(2016, 7, 1) ])
    end
  end


  describe ".find_by_user" do
    let(:tom) { create(:user) }
    let(:jerry) { create(:user) }
    let(:jerry_note) { create(:note, user: jerry) }
    before do
      create(:note, user: tom)
      create(:note, user: tom)
      create(:note, user: tom)
    end

    it "returns the notes that belong to the user" do
      expect(Note.find_by_user(tom).count).to eq(3)
    end

    it "doesn't return the notes that belong other users" do
      expect(Note.find_by_user(tom)).to_not include(jerry_note)
    end
  end


  describe ".find_by_search_term" do
    let(:tom)   { create(:user) }
    let(:note1) { create(:note, content: "*From* is the word you're looking for", user: tom) }
    let(:note2) { create(:note, content: "I am from Italy", user: tom) }
    let(:note3) { create(:note, content: "Where are you from?", user: tom) }
    let(:outsider_note) { create(:note, content: "I don't contain the word you're looking for", user: tom) }

    it "returns notes which content includes the search term" do
      expect(Note.find_by_search_term("from")).to match_array([note1, note2, note3])
    end

    it "doesn't return notes which content doesn't include the search term" do
      expect(Note.find_by_search_term("from")).to_not include(outsider_note)
    end
  end


  describe "relationships" do
    it { is_expected.to belong_to(:user) }
  end


  describe "validations" do
    it "is invalid without a title" do
      expect(build(:note, title: nil)).to_not be_valid
    end

    it "is invalid without a content" do
      expect(build(:note, content: nil)).to_not be_valid
    end

    it "is invalid without a date" do
      expect(build(:note, date: nil)).to_not be_valid
    end
  end

end
