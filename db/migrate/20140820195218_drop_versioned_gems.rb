class DropVersionedGems < ActiveRecord::Migration
  def change
    drop_table :versioned_gems
  end
end
