class RemoveGemIdFromGemUses < ActiveRecord::Migration
  def change
    remove_column :gem_uses, :gem_id, :integer
  end
end
