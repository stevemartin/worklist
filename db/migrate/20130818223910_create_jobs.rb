class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :employer
      t.references :address, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.string :employer_description
      t.text :job_description
      t.references :user

      t.timestamps
    end
  end
end
