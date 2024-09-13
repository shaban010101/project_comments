require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "show" do
    context "when the project exists" do
      let(:project) { create(:project) }

      it "gives back an ok status" do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the project does not exist" do
      it "returns a 404 status" do
        get :show, params: { id: 9999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
