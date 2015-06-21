require 'spec_helper'

describe UpdatesController do

  before :each do
   @file = fixture_file_upload('files/test_csv.csv', 'text/csv')
  end

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all updates as @updates" do
      update = Update.create!(csv_file: @file)
      get :index, {}, valid_session
      expect(assigns(:updates)).to eq([update])
    end
  end

  describe "GET show" do
    it "assigns the requested update as @update" do
      update = Update.create!(csv_file: @file)
      get :show, {:id => update.to_param}, valid_session
      expect(assigns(:update)).to eq(update)
    end
  end

  describe "GET new" do
    it "assigns a new update as @update" do
      get :new, {update: {csv_file: @file}}, valid_session
      expect(assigns(:update)).to be_a_new(Update)
    end
  end

  describe "GET edit" do
    it "does not allow editing" do
      get :edit, {id: 4}
      expect(response.status).to eq(501)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Update" do
        expect {
          post :create, {update: {csv_file: @file}} , valid_session
        }.to change(Update, :count).by(1)
      end

      it "assigns a newly created update as @update" do
        post :create, {update: {csv_file: @file}}, valid_session
        expect(assigns(:update)).to be_a(Update)
        expect(assigns(:update)).to be_persisted
      end

      it "redirects to the created update" do
        post :create, {update: {csv_file: @file}}, valid_session
        expect(response).to redirect_to(Update.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved update as @update" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Update).to receive(:save).and_return(false)
        post :create, {:update => {  }}, valid_session
        expect(assigns(:update)).to be_a_new(Update)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Update).to receive(:save).and_return(false)
        post :create, {:update => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested update" do
        put :update, {id: 4}
        expect(response.status).to eq(501)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested update" do
      delete :destroy, {id: 4}
      expect(response.status).to eq(501)
    end
  end

end
