require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is not valid without a comment" do
    comment = Comment.new(comment: nil)
    expect(comment).to_not be_valid
  end

  it "is not valid without a project" do
    comment = Comment.new(project: nil)
    expect(comment).to_not be_valid
  end

  it "is not valid without a commentor" do
    comment = Comment.new(commentor: nil)
    expect(comment).to_not be_valid
  end
end
