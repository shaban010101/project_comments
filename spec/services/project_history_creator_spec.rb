require 'rails_helper'

RSpec.describe ProjectHistoryCreator do
  describe "#call" do
    subject(:creator) { described_class.new(project.id, change) }
    let(:project) { create(:project) }

    context "when the project history has been created" do
      let(:change) { "Some change" }

      it "outputs true" do
        expect(creator.call).to eq(true)
      end

      it "creates a new history" do
        creator.call
        expect(ProjectHistory.last.attributes.symbolize_keys).to include(project_id: project.id, change: change)
      end
    end

    context "when the project history has not been created" do
      let(:change) { nil }

      it "outputs false" do
        expect(creator.call).to eq(false)
      end

      it "does not create a new history" do
        expect(ProjectHistory.count).to eq(0)
        creator.call
        expect(ProjectHistory.count).to eq(0)
      end
    end
  end
end
