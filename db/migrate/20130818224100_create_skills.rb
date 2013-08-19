class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.string :description
      t.references :skill, index: true
      t.boolean :key_skill
      t.references :user
      t.references :profile

      t.timestamps
    end
  end
end
