class Project < ApplicationRecord
  has_many :comments

  validates :status, :name, presence: true
  validates :status, inclusion: { in: %w(ready in_progress complete) }
end
