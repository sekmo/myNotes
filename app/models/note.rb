class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :content, :date

  delegate :beginning_of_month, to: :date

  def self.grouped_by_month
    order(date: :desc).group_by { |note| note.beginning_of_month }
  end

  def self.find_by_user(user)
    where(user: user)
  end

  def self.find_by_search_term(term)
    if term.present?
      where("content ILIKE ?", "%#{term}%").or(where("title ILIKE ?", "%#{term}%"))
    else
      all
    end
  end
end
