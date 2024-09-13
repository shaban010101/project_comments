class ProjectHistory < ApplicationRecord
  belongs_to :project

  validates :change, :project, presence: true
end
