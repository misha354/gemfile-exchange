class DropGems < ActiveRecord::Migration
  def change
    drop_table :gems
  end
end
