require 'spec_helper'

describe WorklistPresenter do
  subject { described_class.new( worklist ) }
  let(:worklist) do
    OpenStruct.new(
      "id"=>1,
      "user_id"=>1,
      "first_name"=>"Happy",
      "middle_names"=>"Go",
      "last_name"=>"Lucky",
      "date_of_birth"=>DateTime.now,
      "email"=>"some@email.u.like.com",
      "website"=>"jazzhands.com",
      "landline_phone"=>"0123456780",
      "mobile_phone"=>"01234567890",
      "description"=>"Loads of extra joss",
      "education"=>"Extra College",
      "work_history"=>"Joss Factory",
      "personal"=>"Like 2 fly kites",
      "created_at"=>DateTime.now,
      "updated_at"=>DateTime.now,
      "title"=>"Mr",
      "address"=>"1 The Whitehouse",
      "twitter"=>"@obamacares",
      "facebook"=>"lamapyjamas",
      "summary"=>"A Lama Never Lies",
      "career_objectives"=>"Farmer",
      "qualifications"=>"Pyjama expert",
      "url"=>"pyjamalama.farmer",
      "url_key"=>"s0M3-kEE",

      "skills" => skills_attributes,
      "experiences" => experiences_attributes,
      "jobs" => jobs_attributes,
      "qualifications" => qualifications_attributes
     )
  end

  let(:skills_attributes) do
    double(:skills, order: [OpenStruct.new(:id => 1)])
  end

  let(:experiences_attributes) do
    double(:experiences, order: [OpenStruct.new(:id => 1)])
  end

  let(:jobs_attributes) do
    double(:jobs, order: [OpenStruct.new(:id => 1, skills:skills_attributes, experiences:experiences_attributes)])
  end

  let(:qualifications_attributes) do
    double(:qualifications, order: [OpenStruct.new(:id => 1)])
  end

  it 'should output hash attributes by default' do
    subject.attributes.should == {:id=>1, :address=>"1 The Whitehouse", :career_objectives=>"Farmer", :email=>"some@email.u.like.com", :jobs_attributes=>{1=>{:id=>1, :address=>nil, :description=>nil, :employer=>nil, :employer_description=>nil, :end_date=>nil, :skills_attributes=>{1=>{:id=>1, :key_skill=>nil, :title=>nil, :display_order=>nil}}, :experiences_attributes=>{1=>{:id=>1, :heading=>nil, :content=>nil, :display_order=>nil}}, :start_date=>nil, :title=>nil, :display_order=>nil}}, :qualifications_attributes=>{1=>{:id=>1, :grade=>nil, :institute=>nil, :title=>nil, :display_order=>nil}}, :skills_attributes=>{1=>{:id=>1, :key_skill=>nil, :title=>nil, :display_order=>nil}}, :experiences_attributes=>{1=>{:id=>1, :heading=>nil, :content=>nil, :display_order=>nil}}, :summary=>"A Lama Never Lies", :title=>"Mr", :url=>"pyjamalama.farmer", :url_key=>"s0M3-kEE"}
  end

  it 'should output array attributes when requested' do
    subject.attributes(:array).should == {:id=>1, :address=>"1 The Whitehouse", :career_objectives=>"Farmer", :email=>"some@email.u.like.com", :jobs_attributes=>[{:id=>1, :address=>nil, :description=>nil, :employer=>nil, :employer_description=>nil, :end_date=>nil, :skills_attributes=>[{:id=>1, :key_skill=>nil, :title=>nil, :display_order=>nil}], :experiences_attributes=>[{:id=>1, :heading=>nil, :content=>nil, :display_order=>nil}], :start_date=>nil, :title=>nil, :display_order=>nil}], :qualifications_attributes=>[{:id=>1, :grade=>nil, :institute=>nil, :title=>nil, :display_order=>nil}], :skills_attributes=>[{:id=>1, :key_skill=>nil, :title=>nil, :display_order=>nil}], :experiences_attributes=>[{:id=>1, :heading=>nil, :content=>nil, :display_order=>nil}], :summary=>"A Lama Never Lies", :title=>"Mr", :url=>"pyjamalama.farmer", :url_key=>"s0M3-kEE"}
  end

  it 'should output the JSON version of the array' do
    JSON.parse( subject.as_json(:array) ).should == {"id"=>1, "address"=>"1 The Whitehouse", "career_objectives"=>"Farmer", "email"=>"some@email.u.like.com", "jobs_attributes"=>[{"id"=>1, "address"=>nil, "description"=>nil, "employer"=>nil, "employer_description"=>nil, "end_date"=>nil, "skills_attributes"=>[{"id"=>1, "key_skill"=>nil, "title"=>nil, "display_order"=>nil}], "experiences_attributes"=>[{"id"=>1, "heading"=>nil, "content"=>nil, "display_order"=>nil}], "start_date"=>nil, "title"=>nil, "display_order"=>nil}], "qualifications_attributes"=>[{"id"=>1, "grade"=>nil, "institute"=>nil, "title"=>nil, "display_order"=>nil}], "skills_attributes"=>[{"id"=>1, "key_skill"=>nil, "title"=>nil, "display_order"=>nil}], "experiences_attributes"=>[{"id"=>1, "heading"=>nil, "content"=>nil, "display_order"=>nil}], "summary"=>"A Lama Never Lies", "title"=>"Mr", "url"=>"pyjamalama.farmer", "url_key"=>"s0M3-kEE"}
  end

end
