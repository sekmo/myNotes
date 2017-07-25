require "rails_helper"

describe Note do

  describe ".grouped_by_month" do
    before do
      @user = FactoryGirl.create(:user)
      FactoryGirl.create(:note, date: Date.new(2017, 7, 1), user: @user)
      FactoryGirl.create(:note, date: Date.new(2017, 7, 4), user: @user)
      FactoryGirl.create(:note, date: Date.new(2017, 8, 4), user: @user)
      FactoryGirl.create(:note, date: Date.new(2016, 7, 4), user: @user)
    end

    it "should work" do
      result = Note.grouped_by_month
      expect(result[ Date.new(2017,7,1) ].size).to eq(2)
      expect(result.keys).to eq([ Date.new(2017,8,1), Date.new(2017,7,1), Date.new(2016,7,1) ])
    end
  end


  describe ".find_by_user" do
    before do
      @kyle = FactoryGirl.create(:user)
      @stephen = FactoryGirl.create(:user)
      FactoryGirl.create(:note, user: @kyle)
      FactoryGirl.create(:note, user: @kyle)
      FactoryGirl.create(:note, user: @kyle)
      @stephen_note = FactoryGirl.create(:note, user: @stephen)
    end

    it "returns the notes that belong to the user" do
      expect(Note.find_by_user(@kyle).count).to eq(3)
    end

    it "doesn't return the notes that belong other users" do
      expect(Note.find_by_user(@kyle)).to include(@stephen_note)
    end
  end


  describe ".find_by_search_term" do
    before do
      @note1 = FactoryGirl.create(:note, content: "Hello from the other side")
      @note2 = FactoryGirl.create(:note, content: "I am from Italy")
      @note3 = FactoryGirl.create(:note, content: "From Tokyo with love")
      @note4 = FactoryGirl.create(:note, content: "Where are you from?")
    end

    it "returns the notes which content includes the term" do
      expect(Note.find_by_search_term("from")).to match_array([@note1, @note2, @note3, @note4])
    end
  end


  context "relationships" do
    it { should belong_to(:user) }
  end


  context "validations" do
    it "is invalid without a title" do
      expect(FactoryGirl.build(:note, title: nil)).to_not be_valid
    end

    it "is invalid without a content" do
      expect(FactoryGirl.build(:note, content: nil)).to_not be_valid
    end

    it "is invalid without a date" do
      expect(FactoryGirl.build(:note, date: nil)).to_not be_valid
    end
  end

end
