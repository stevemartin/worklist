require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WorklistsController do

  let(:valid_attributes) { { "title" => "MyString" } }

  let(:valid_session) { {} }

  let(:user) { double('user', worklist: worklist, id:1) }
  let(:worklist) { Worklist.create! valid_attributes }

  before do
    allow_message_expectations_on_nil
    request.env['warden'].stub(:authenticate! => user)
    controller.stub :current_user => user
  end

  describe "GET show" do
    it "assigns the requested worklist as @worklist" do
      get :show, params: {format: :json}, session: valid_session
      assigns(:worklist).should eq(worklist)
    end
  end

  describe "GET new" do
    it "assigns a new worklist as @worklist" do
      get :new, params: {format: :json}, session: valid_session
      assigns(:worklist).should be_a_new(Worklist)
    end
  end

  describe "GET edit" do
    it "assigns the requested worklist as @worklist" do
      get :edit, params: {format: :json}, session: valid_session
      assigns(:worklist).should eq(worklist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Worklist" do
        expect {
          post :create, params: {:worklist => valid_attributes, format: :json},  session: valid_session
        }.to change(Worklist, :count).by(1)
      end

      it "assigns a newly created worklist as @worklist" do
        post :create, params: {:worklist => valid_attributes, format: :json}, session: valid_session
        assigns(:worklist).should be_a(Worklist)
        assigns(:worklist).should be_persisted
      end

      it "renders  the created worklist" do
        post :create, params: {:worklist => valid_attributes, format: :json}, session: valid_session
        parsed_response.should have_key("worklist")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved worklist as @worklist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Worklist.any_instance.stub(:save).and_return(false)
        post :create, params: {:worklist => { "title" => "invalid value" }, format: :json}, session: valid_session
        assigns(:worklist).should be_a_new(Worklist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Worklist.any_instance.stub(:save).and_return(false)
        post :create, params: {:worklist => { "title" => "invalid value" }, format: :json}, session: valid_session
        response.status.should eq(422)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested worklist" do
        worklist = Worklist.create! valid_attributes
        # Assuming there are no other worklists in the database, this
        # specifies that the Worklist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Worklist.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, params: {:worklist => { "title" => "MyString" }, format: :json}, session: valid_session
      end

      it "assigns the requested worklist as @worklist" do
        put :update, params: {:worklist => valid_attributes, format: :json}, session: valid_session
        assigns(:worklist).should eq(worklist)
      end

      it "redirects to the worklist" do
        put :update, params: {:worklist => valid_attributes, format: :json}, session: valid_session
        parsed_response.should have_key("worklist")
      end
    end

    describe "with invalid params" do
      it "assigns the worklist as @worklist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Worklist.any_instance.stub(:save).and_return(false)
        put :update, params: {:worklist => { "title" => "invalid value" }, format: :json}, session: valid_session
        assigns(:worklist).should eq(worklist)
      end

      it "re-renders the 'edit' template" do
        worklist = Worklist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Worklist.any_instance.stub(:save).and_return(false)
        put :update, params: {:worklist => { "title" => "invalid value" }, format: :json}, session: valid_session
        response.status.should eq(422)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested worklist" do
      worklist = Worklist.create! valid_attributes
      expect {
        delete :destroy, params: {format: :json}, session: valid_session
      }.to change(Worklist, :count).by(-1)
    end

    it "returns success" do
      worklist = Worklist.create! valid_attributes
      delete :destroy, params: {format: :json}, session: valid_session
      response.status.should eq(200)
    end
  end

  def parsed_response
    JSON.parse response.body
  end

end
