class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.datetime :date_of_birth
      t.string :email_address
      t.string :website
      t.string :landline_phone
      t.string :mobile_phone
      t.text :description
      t.text :education
      t.text :work_history
      t.text :personal

      t.timestamps
    end
  end
end
