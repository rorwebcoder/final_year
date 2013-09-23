class AddInviteFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_invited, :boolean, :default => false
  end
end
