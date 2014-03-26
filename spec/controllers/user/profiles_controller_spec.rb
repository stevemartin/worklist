require 'spec_helper'

describe User::ProfilesController do

  # This should return the minimal set of attributes required to create a valid
  # User::Profile. As you add validations to User::Profile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "first_name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # User::ProfilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user_with_profile) { FactoryGirl.create(:user_with_profile) }
  let(:user_without_profile) { FactoryGirl.create(:user) }

  describe "GET show" do
    it "assigns the requested user_profile as @user_profile" do
      profile = user_with_profile.profile
      get :show, {:user_id => user_with_profile.id}, valid_session
      assigns(:user_profile).should eq(profile)
    end
  end

  describe "GET new" do
    it "assigns a new user_profile as @user_profile" do
      get :new, {:user_id => user_with_profile.id}, valid_session
      assigns(:user_profile).should be_a_new(User::Profile)
      assigns(:jobs).should be_an ActiveRecord::Associations::CollectionProxy
      assigns(:skills).should be_an ActiveRecord::Associations::CollectionProxy
    end
  end

  describe "GET edit" do
    it "assigns the requested user_profile as @user_profile" do
      get :edit, {:user_id => user_with_profile.id}, valid_session
      assigns(:user_profile).should eq(user_with_profile.profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User::Profile" do
        expect {
          post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
        }.to change(User::Profile, :count).by(1)
      end

      it "assigns a newly created user_profile as @user_profile" do
        post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
        assigns(:user_profile).should be_a(User::Profile)
        assigns(:user_profile).should be_persisted
      end

      context 'when its an ajax request' do
        it 'returns the cv data as json' do
          xhr :post, :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
          JSON.parse( response.body ).should be_a(Hash)
          # {
          #   "user_id"=>2,
          #   "user_profile"=>{
          #     "id"=>1,
          #     "address"=>nil,
          #     "career_objectives"=>nil,
          #     "email"=>nil,
          #     "jobs_attributes"=>{},
          #     "qualifications_attributes"=>{},
          #     "skills_attributes"=>{},
          #     "summary"=>nil,
          #     "title"=>nil,
          #     "url"=>"1",
          #     "url_key"=>"c3387dd5-58ad-49cc-9ded-22b7f6cb603e"
          #   }
          # }
          # response.body.should == {:user_id => nil, :user_profile => valid_attributes}.to_json
        end
      end

      it "redirects to the created user_profile" do
        post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
        response.should redirect_to(User::Profile.last)
      end

      context "with new jobs" do
        let(:valid_attributes) do
          {
            first_name:'Bugs',
            last_name:'Bunny',
            jobs_attributes:[
              {employer:'Loony Toons'},
              {employer:'Time Warner'}
            ]
          }
        end

        it "assigns the jobs to the user profile" do
          expect {
            post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
          }.to change(Job, :count).by(2)
        end

        it "redirects to the created user_profile" do
          post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
          response.should redirect_to(User::Profile.last)
        end
      end

      context "with new skills" do
        let(:valid_attributes) do
          {
            first_name:'Bugs',
            last_name:'Bunny',
            skills_attributes:[
              {title:'Sales guru'},
              {title:'Super hero'}
            ]
          }
        end

        it "assigns the jobs to the user profile" do
          expect {
            post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
          }.to change(Skill, :count).by(2)
        end

        it "redirects to the created user_profile" do
          post :create, {:user_id => user_without_profile.id, :user_profile => valid_attributes}, valid_session
          response.should redirect_to(User::Profile.last)
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_profile as @user_profile" do
        # Trigger the behavior that occurs when invalid params are submitted
        User::Profile.any_instance.stub(:save).and_return(false)
        post :create, {:user_id => user_with_profile.id, :user_profile => { "first_name" => "invalid value" }}, valid_session
        assigns(:user_profile).should be_a_new(User::Profile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User::Profile.any_instance.stub(:save).and_return(false)
        post :create, {:user_id => user_with_profile.id, :user_profile => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_profile" do
        # Assuming there are no other user_profiles in the database, this
        # specifies that the User::Profile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User::Profile.any_instance.should_receive(:update).with({ "first_name" => "MyString" })
        put :update, {:user_id => user_with_profile.id, :user_profile => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested user_profile as @user_profile" do
        put :update, {:user_id => user_with_profile.id, :user_profile => valid_attributes}, valid_session
        assigns(:user_profile).should eq(user_with_profile.profile)
      end

      it "should succeed" do
        put :update, {:user_id => user_with_profile.id, :user_profile => valid_attributes}, valid_session
        response.code.should eq("200")
      end

      context "with existing skills" do
        let(:skill_1) do
          # binding.pry
          FactoryGirl.create(:skill, title:"Skill 1", profile_id: user_with_profile.profile.id,
                            user_id:user_with_profile.id)
        end

        let(:skill_2) do
          FactoryGirl.create(:skill, title:"Skill 2", :profile_id => user_with_profile.profile.id,
                            user_id:user_with_profile.id)
        end

        let(:valid_attributes) do
          {
            first_name:'Bugs',
            last_name:'Bunny',
            skills_attributes:[
              {id: skill_1.id, title:'Sales guru'},
              {id: skill_2.id, title:'Super hero'}
            ]
          }
        end

        before do
          skill_1
          skill_2
        end

        it "does not create new skills" do
          expect {
            post :update, {:user_id => user_with_profile.id, :user_profile => valid_attributes}, valid_session
          }.to change(Skill, :count).by(0)
        end

        it 'updates the existing skill attributes' do
          expect {
            post :update, {:user_id => user_with_profile.id, :user_profile => valid_attributes}, valid_session
          }.to change(Skill, :count).by(0)
          Skill.find(skill_1.id).title.should == 'Sales guru'
        end

        it "should succeed" do
          post :update, {:user_id => user_with_profile.id, :user_profile => valid_attributes}, valid_session
          response.code.should eq("200")
        end
      end
    end

    describe "with invalid params" do
      it "assigns the user_profile as @user_profile" do
        user = user_with_profile
        profile = user.profile
        # Trigger the behavior that occurs when invalid params are submitted
        User::Profile.any_instance.stub(:save).and_return(false)
        put :update, {:user_id => user.id, :user_profile => { "first_name" => "invalid value" }}, valid_session
        assigns(:user_profile).should eq(profile)
      end

      it "re-renders the 'edit' template" do
        user = user_with_profile
        # Trigger the behavior that occurs when invalid params are submitted
        User::Profile.any_instance.stub(:save).and_return(false)
        put :update, {:user_id => user.id, :user_profile => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user_profile" do
      user_with_profile = FactoryGirl.create(:user_with_profile)
      # profile = user_with_profile.profile
      expect {
        delete :destroy, {:user_id => user_with_profile.id}, valid_session
      }.to change(User::Profile, :count).by(-1)
    end

    it "redirects to the user_profiles list" do
      user_with_profile = FactoryGirl.create(:user_with_profile)
      delete :destroy, {:user_id => user_with_profile.id}, valid_session
      response.should redirect_to(user_profile_url)
    end
  end

end
