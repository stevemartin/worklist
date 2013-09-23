class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :title, :string
    add_column :profiles, :address, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :facebook, :string
    add_column :profiles, :summary, :string
    add_column :profiles, :career_objectives, :string
    add_column :profiles, :qualifications, :string
    rename_column :profiles, :email_address, :email
  end
end
