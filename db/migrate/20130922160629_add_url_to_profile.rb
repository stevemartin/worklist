class AddUrlToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :url, :string
    add_column :profiles, :url_key, :string
  end
end
