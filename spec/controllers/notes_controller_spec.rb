require 'rails_helper'

describe NotesController, type: :controller do
  before { @user = FactoryGirl.create(:user)  }

  describe "GET index" do
    it "should redirect unlogged users to welcome#index" do
      get :index
      expect(response).to redirect_to(welcome_url)
    end
  end

  describe "POST create" do
    context "when user is logged in" do
      before do
        sign_in @user
      end

      it "should create a new note" do
        #Note.count should increment by one
        #assert_redirected_to notes_url
      end
    end

    context "when user is not logged in" do
      it "should redirect to welcome#index" do
        #expect(response.status).to eq(200)
        post :create
        expect(response).to redirect_to(welcome_url)
      end
    end
  end
end
