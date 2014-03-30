class User::Profile < ActiveRecord::Base
  self.table_name = 'profiles'
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :qualifications, dependent: :destroy

  accepts_nested_attributes_for :skills, :jobs, :qualifications, allow_destroy: true
  after_create :generate_url

  private
  def generate_url
    self.url = self.id.to_s(36)
    self.url_key = SecureRandom.uuid.to_s
    Rails.logger.info "New url key is: #{self.url_key}" if ENV['LOG_SENSITIVE'] == true
    save
  end
end
