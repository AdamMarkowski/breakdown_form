# Alert
class Admin::Alert < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 100, maximum: 1000 }
  validates :category, presence: true
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  enum category: [:breakdown, :damage, :fault]
  enum status: [:unread, :read]
end
