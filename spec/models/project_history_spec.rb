require 'rails_helper'

RSpec.describe ProjectHistory, type: :model do
  it "is not valid without a change" do
    project_history = ProjectHistory.new(change: nil)
    expect(project_history).to_not be_valid
  end

  it "is not valid without a project" do
    project_history = ProjectHistory.new(project: nil)
    expect(project_history).to_not be_valid
  end
end
