class AddJobIdToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :job_id, :integer
  end
end
