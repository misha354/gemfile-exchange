class AddGemInstanceIdToGemUses < ActiveRecord::Migration
  def change
    add_column :gem_uses, :gem_instance_id, :integer
  end
end
