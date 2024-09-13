require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is not valid without a name" do
    project = Project.new(name: nil)
    expect(project).to_not be_valid
  end

  it "is not valid without a status" do
    project = Project.new(status: nil)
    expect(project).to_not be_valid
  end

  it "is not valid with a status which is not supported" do
    project = Project.new(status: "planned")
    expect(project).to_not be_valid
  end
end
