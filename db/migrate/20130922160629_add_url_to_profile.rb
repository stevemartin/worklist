class AddUrlToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :url, :string
  end
end
