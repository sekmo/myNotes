require "rails_helper"

describe NotesController, type: :controller do
  describe "GET index" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "redirects to the welcome#index" do
        get :index
          expect(response).to redirect_to(welcome_url)
      end
    end
  end


  describe "POST create" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      context "with valid attributes" do
        it "creates a new note" do
          note_params = attributes_for(:note)
          sign_in @user
          expect {
            post :create, params: { note: note_params }
          }.to change(@user.notes, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "doesn't create a new note" do
          note_params = attributes_for(:note, content: nil)
          sign_in @user
          expect {
            post :create, params: { note: note_params }
          }.to_not change(@user.notes, :count)
        end
      end
    end

    context "as a guest" do
      it "redirects to the welcome#index" do
        note_params = attributes_for(:note)
        post :create, params: { note: note_params }
        expect(response).to redirect_to(welcome_url)
      end
    end
  end


  describe "PATCH update" do
    context "as an authorized user" do
      before do
        @user = create(:user)
        @note = create(:note, user: @user, title: "Original note title")
      end

      it "updates a note" do
        note_params = attributes_for(:note, title: "New note title")
        sign_in @user
        patch :update, params: { id: @note.id, note: note_params }
        expect(@note.reload.title).to eq "New note title"
      end
    end

    context "as an unauthorized user" do
      before do
        @tom   = create(:user)
        @tom_note = create(:note, user: @tom, title: "Original note title")
        @jerry = create(:user)
      end

      it "doesn't update the note" do
        note_params = attributes_for(:note, title: "New Note Name")
        sign_in @jerry
        patch :update, params: { id: @tom_note.id, note: note_params }
        expect(@tom_note.reload.title).to eq "Original note title"
      end

      it "redirects to the root" do
        note_params = attributes_for(:note)
        sign_in @jerry
        patch :update, params: { id: @tom_note.id, note: note_params }
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @note = create(:note)
      end

      it "redirects to the welcome#index" do
        note_params = attributes_for(:note)
        patch :update, params: { id: @note.id, note: note_params }
        expect(response).to redirect_to(welcome_url)
      end
    end
  end


  describe "DELETE destroy" do
    context "as an authorized user" do
      before do
        @user = create(:user)
        @note = create(:note, user: @user)
      end

      it "deletes a note" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @note.id }
        }.to change(@user.notes, :count).by(-1)
      end
    end

    context "as an unauthorized user" do
      before do
        @tom = create(:user)
        @tom_note = create(:note, user: @tom)
        @jerry = create(:user)
      end

      it "does not delete the note" do
        sign_in @jerry
        expect {
          delete :destroy, params: { id: @tom_note.id }
        }.to_not change(Note, :count)
      end

      it "redirects to root" do
        sign_in @jerry
        delete :destroy, params: { id: @tom_note.id }
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @note = create(:note)
      end


      it "redirects to the welcome#index" do
        delete :destroy, params: { id: @note.id }
        expect(response).to redirect_to(welcome_url)
      end

      it "does not delete the note" do
        expect {
          delete :destroy, params: { id: @note.id }
        }.to_not change(Note, :count)
      end
    end
  end
end
