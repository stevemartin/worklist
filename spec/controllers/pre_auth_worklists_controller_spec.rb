require 'spec_helper'

describe PreAuthWorklistsController do

  let(:url) { "1" }
  let(:url_key) { "url-k3y" }
  let(:valid_attributes) { { 'title' => 'Valid Title' } }
  let(:valid_session) { {} }

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) { { title: "MyTitle" } }
      it "creates a new Worklist" do
        expect {
          post :create, {:worklist => valid_attributes, :format => :json}, valid_session
        }.to change(Worklist, :count).by(1)
      end

      it 'sets the url and url_key cookies with a 30 day expiry' do
        Worklist.any_instance.stub(:url).and_return(url)
        Worklist.any_instance.stub(:url_key).and_return(url_key)
        expect {
          post :create, {:worklist => valid_attributes, :format => :json}, valid_session
        }.to change(Worklist, :count).by(1)
        response.cookies['url'].should == url
        response.cookies['url_key'].should == url_key
      end

      it "assigns a newly created worklist as @worklist" do
        post :create, {:worklist => valid_attributes, :format => :json}, valid_session
        assigns(:worklist).should be_a(Worklist)
        assigns(:worklist).should be_persisted
      end

      it "redirects to the created worklist" do
        post :create, {:worklist => valid_attributes, :format => :json}, valid_session
        response.should render_template("show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved worklist as @worklist" do
        Worklist.any_instance.stub(:save).and_return(false)
        post :create, {:worklist => { "url" => "invalid value" }, :format => :json}, valid_session
        assigns(:worklist).should be_a_new(Worklist)
      end

      it "re-renders the 'new' template" do
        Worklist.any_instance.stub(:save).and_return(false)
        post :create, {:worklist => { "url" => "invalid value" }, :format => :json}, valid_session
        response.header['Content-Type'].should include 'application/json'
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested worklist" do
        worklist = Worklist.create! valid_attributes
        Worklist.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:url => worklist.url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
      end

      it "assigns the requested worklist as @worklist" do
        worklist = Worklist.create! valid_attributes
        put :update, {:url => worklist.url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        assigns(:worklist).should eq(worklist)
      end

      it "redirects to the worklist" do
        worklist = Worklist.create! valid_attributes
        put :update, {:url => worklist.url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        response.should render_template("show")
      end
    end

    describe "with invalid params" do
      it "assigns the worklist as @worklist" do
        worklist = Worklist.create! valid_attributes
        Worklist.any_instance.stub(:save).and_return(false)
        put :update, {:url => worklist.url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        assigns(:worklist).should eq(worklist)
      end

      it "re-renders the 'edit' template" do
        worklist = Worklist.create! valid_attributes
        Worklist.any_instance.stub(:save).and_return(false)
        put :update, {:url => worklist.url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        response.header['Content-Type'].should include 'application/json'
      end
    end

    describe "with invalid url signature" do

      let(:invalid_url) { "not-the-correct-url-#{worklist.to_param}" }
      let(:invalid_url_key) { "not-the-correct-url_key-#{worklist.to_param}" }
      let(:worklist) { Worklist.create! valid_attributes }

      it "returns an error code when url_key is invalid" do
        put :update, {:url => worklist.url, :url_key => invalid_url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        response.code.should eq("404")
      end

      it "returns an error code when url is invalid" do
        put :update, {:url => invalid_url, :url_key => worklist.url_key, :worklist => { "title" => "MyString"}, :format => :json }, valid_session
        response.code.should eq("404")
      end

    end
  end
end
