# Alert
class Admin::Alert < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 100, maximum: 1000 }
  validates :category, presence: true
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  enum category: [:breakdown, :damage, :fault]
  enum status: [:unread, :read]

  before_save :set_price_and_deadline

  def set_price_and_deadline
    case category
    when 'breakdown'
      self.deadline = Time.now + 4.hours
      (Time.parse('9:00')..Time.parse('17:00')).cover?(Time.now) ? self.price = 50 : self.price = 100
    when 'damage'
      self.deadline = Time.now + 1.day
      self.price = 10
    when 'fault'
      self.deadline = Time.now + 3.days
      self.price = 1
    end
  end
end
