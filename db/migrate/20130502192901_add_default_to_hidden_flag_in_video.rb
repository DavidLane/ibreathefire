class AddDefaultToHiddenFlagInVideo < ActiveRecord::Migration
  def change
		change_column_default :videos, :is_hidden, false
  end
end
