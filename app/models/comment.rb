class Comment < ApplicationRecord
  belongs_to :project
  validates :comment, :commentor, :project, presence: true
end
