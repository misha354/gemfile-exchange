class CreateVersionedGems < ActiveRecord::Migration
  def change
    create_table :versioned_gems do |t|
      t.string :gem_name
      t.string :gem_version
      t.timestamps
    end
  end
end
