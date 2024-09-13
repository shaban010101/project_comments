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
      it "redirects to the project" do
        post :create, params: params
        expect(response).to have_http_status(:redirect)
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

      it "stays on the page and renders the error" do
        post :create, params: params
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end
end
