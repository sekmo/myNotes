class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :content, :date

  def self.grouped_by_month
    order(date: :DESC).group_by { |note| note.date.beginning_of_month }
  end

  def self.find_by_user(user)
    where(user: user)
  end

  def self.find_by_search_term(term)
    #where(content: term)
    all
  end
end
