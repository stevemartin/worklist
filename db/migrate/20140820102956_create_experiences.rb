class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :heading
      t.text :content
      t.integer :display_order
      t.datetime :start_date
      t.datetime :end_date
      t.references :worklist, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
