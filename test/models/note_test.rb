require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  setup do
    @user = users(:francesco)
  end

  test "grouped_by_month should work" do
    result = Note.grouped_by_month(@user)
    assert_equal(2, result[Date.new(2017,7,1)].size)
    assert_equal([Date.new(2017,8,1), Date.new(2017,7,1), Date.new(2016,7,1)], result.keys)
  end
end
