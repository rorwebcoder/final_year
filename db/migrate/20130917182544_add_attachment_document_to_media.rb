class AddAttachmentDocumentToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :media, :document
  end
end
