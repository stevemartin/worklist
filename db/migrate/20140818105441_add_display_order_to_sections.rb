class AddDisplayOrderToSections < ActiveRecord::Migration
  def change
    add_column :jobs,           :display_order, :integer
    add_column :qualifications, :display_order, :integer
    add_column :skills,         :display_order, :integer
  end
end
