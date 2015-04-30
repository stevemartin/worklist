class WorklistSummaryIsText < ActiveRecord::Migration
  def change
    change_column :worklists, :summary, :text
  end
end
