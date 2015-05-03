class MigrateDisplayOrderData < ActiveRecord::Migration
  def up
    Experience.where('display_order IS NULL').update_all(display_order: 0)
    Job.where('display_order IS NULL').update_all(display_order: 0)
    Qualification.where('display_order IS NULL').update_all(display_order: 0)
    Skill.where('display_order IS NULL').update_all(display_order: 0)
  end
end
