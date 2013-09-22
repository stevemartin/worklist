class DummyUser < ActiveRecord::Base
  before_save :dummy_email

  def dummy_email
    self.email = (Time.now.to_i + rand(9999999).to_i).to_s
  end

  self.table_name = 'users'

  has_one :profile, :class_name => 'User::Profile', :foreign_key => :user_id

end
