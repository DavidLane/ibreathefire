class ChangeIsFeaturedTypeForVideo < ActiveRecord::Migration
  def up
    change_table :videos do |t|
      t.change :is_featured, :boolean
    end
  end

  def down
    change_table :videos do |t|
      t.change :is_featured, :integer
    end
  end
end
