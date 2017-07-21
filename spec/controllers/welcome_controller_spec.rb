require "rails_helper"

describe WelcomeController, type: :controller do
  describe "GET index" do
    it "should return success" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
