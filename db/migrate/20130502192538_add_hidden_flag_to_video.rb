class AddHiddenFlagToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :is_hidden, :boolean
  end
end
