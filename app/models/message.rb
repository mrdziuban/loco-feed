class Message < ActiveRecord::Base
  validates :text, length: { maximum: 140 }
  validates_numericality_of :time_to_live, less_than_or_equal_to: 24*60*60
  validates :priority, inclusion: { in: 1..10 }
end
