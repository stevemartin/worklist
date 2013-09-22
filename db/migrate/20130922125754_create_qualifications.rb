class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :title
      t.string :grade
      t.string :institute
      t.references :profile, index: true

      t.timestamps
    end
  end
end
