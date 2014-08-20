class AddGemIdToGemUses < ActiveRecord::Migration
  def change
    add_column :gem_uses, :gem_id, :integer
  end
end
