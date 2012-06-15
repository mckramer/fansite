class Event < ActiveRecord::Base

  CATEGORY_OPTIONS = %w[concert television]

  belongs_to :location
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :teaser
  validates_presence_of :location
  validate :start_at_and_end_at
  
  scope :upcoming, lambda {
    where(:start_at => Date.today..Date.today.next_month)
  }
  
  def self.random(sample_size = 3)
    return nil if count == 0
    sample_size = count if count < sample_size
    return order("updated_at DESC").limit(sample_size).sample
  end
  
  private
  
  # validates start_at and end_at dates
  def start_at_and_end_at
    if start_at == end_at
      errors.add(:start_at, "cannot equal the end at")
      errors.add(:end_at, "cannot equal the start at")
    elsif start_at > end_at
      errors.add(:start_at, "cannot be after the end at")
      errors.add(:end_at, "cannot be before the start at")
    end
  end
end