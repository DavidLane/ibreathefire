class AddSlugToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :slug, :text
  end
end
