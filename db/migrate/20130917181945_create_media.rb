class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
