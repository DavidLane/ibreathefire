class AddIsApprovedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_approved, :boolean
  end
end
