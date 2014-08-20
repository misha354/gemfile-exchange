class ChangeGemUses < ActiveRecord::Migration
  def change
    remove_column :gem_uses, :versioned_gem_id
    add_column :gem_uses, :version, :string
  end
end
