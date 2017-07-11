class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :content, :date

  def self.grouped_by_month(user)
    Note.where(user_id: user.id).order(date: :DESC).group_by { |note| note.date.beginning_of_month }
  end
end
