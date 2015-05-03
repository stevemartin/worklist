class ModifyDisplayOrderValues < ActiveRecord::Migration
  def change

    change_column :experiences,    :display_order, :integer, default: 0
    change_column :jobs,           :display_order, :integer, default: 0
    change_column :qualifications, :display_order, :integer, default: 0
    change_column :skills,         :display_order, :integer, default: 0


  end
end
