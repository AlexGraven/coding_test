class AddAttachmentCsvFileToUpdates < ActiveRecord::Migration
  def self.up
    change_table :updates do |t|
      t.attachment :csv_file
    end
  end

  def self.down
    remove_attachment :updates, :csv_file
  end
end
