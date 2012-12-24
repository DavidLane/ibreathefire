class AddAttachmentBannerToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :banner
    end
  end

  def self.down
    drop_attached_file :events, :banner
  end
end
