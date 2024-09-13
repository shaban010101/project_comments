require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /show" do
    let(:project) { create(:project) }

    context "when the project has been found" do
      it "renders the project page" do
        get "/projects/#{project.id}"
        expect(response).to render_template(:show)
      end
    end

    context "when the project cannot be found" do
      it "does not render the project page" do
        get "/projects/99999"
        expect(response).to_not render_template(:show)
      end
    end
  end
end
