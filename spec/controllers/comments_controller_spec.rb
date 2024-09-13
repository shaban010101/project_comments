require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "#create" do
    let(:project) { create(:project) }
    context "when the comment has been saved" do
      let(:params) do
        {
          project_id: project.id,
          comment: {
            comment: "Super",
            commentor: "SuperStar"
          }
        }
      end

      it "returns a successful response", :aggregate_failures do
        post :create, params: params
        expect(response).to have_http_status(:redirect)
        expect(Comment.count).to eq(1)
        expect(ProjectHistory.count).to eq(1)
      end
    end

    context "when the comment has not been saved" do
      let(:params) do
        {
          project_id: project.id,
          comment: {
            comment: nil,
            commentor: nil
          }
        }
      end

      it "returns an error response", :aggregate_failures do
        post :create, params: params
        expect(response).to have_http_status(:unprocessable_content)
        expect(Comment.count).to eq(0)
        expect(ProjectHistory.count).to eq(0)
      end
    end
  end
end
