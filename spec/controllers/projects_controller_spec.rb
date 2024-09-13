require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { create(:project) }

  describe "show" do
    context "when the project exists" do
      it "gives back an ok status", :aggregate_failures do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:ok)
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:comments)).to be_a(ActiveRecord::AssociationRelation)
        expect(assigns(:histories)).to be_a(ActiveRecord::AssociationRelation)
      end
    end

    context "when the project does not exist" do
      it "returns a 404 status" do
        get :show, params: { id: 9999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "#update" do
    context "when the project is updated" do
      it "redirects back to the project page", :aggregate_failures do
        update_project(project, "complete")
        expect(response).to redirect_to(project_path(project))
        expect(project.reload.status).to eq("complete")
      end
    end

    context "when the project has not been updated" do
      it "redirects back to the project page", :aggregate_failures do
        update_project(project, "completed")
        expect(response).to render_template("projects/show")
        expect(project.reload.status).to eq("ready")
      end
    end
  end

  def update_project(project, status)
    patch :update, params: { id: project.id, project: { status: status} }
  end
end
