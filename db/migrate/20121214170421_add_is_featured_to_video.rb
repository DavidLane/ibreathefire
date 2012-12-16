class AddIsFeaturedToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :is_featured, :int
  end
end
