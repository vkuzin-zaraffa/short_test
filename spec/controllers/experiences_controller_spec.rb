require 'rails_helper'

RSpec.describe ExperiencesController, type: :controller do
  describe "GET index" do
    let(:experience) { create :experience }

    it "returns a 200" do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "assigns @teams" do
      get :index
      expect(assigns(:experiences)).to eq([experience])
    end
  end

  describe "GET index" do
    it "returns a 200" do
      get :new
      expect(response).to have_http_status(:ok)
    end
    it "renders the index template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
      it "responds to html by default" do
        post :create, :params => {
            experience:
                { name: Faker.name,
                  rating: Faker::Number.decimal(l_digits: 1, r_digits: 2)
                }
        }
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end
  end
end