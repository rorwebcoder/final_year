class AddColumnToMedia < ActiveRecord::Migration
  def change
    add_column :media, :is_processed, :boolean, :default => false
  end
end
