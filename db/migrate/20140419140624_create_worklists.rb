class CreateWorklists < ActiveRecord::Migration
  def change
    create_table :worklists do |t|
      t.references :user
      t.string :url
      t.string :url_key
      t.string :title
      t.string :twitter
      t.string :facebook
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.datetime :date_of_birth
      t.string :email
      t.string :email_address
      t.string :address
      t.string :career_objectives
      t.string :website
      t.string :landline_phone
      t.string :mobile_phone
      t.text :description
      t.string :summary
      t.text :personal

      t.timestamps
    end
  end
end
