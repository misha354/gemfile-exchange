class RenameGemuseGemVersionIdToGemuseVersionedGemId < ActiveRecord::Migration
  def change
    remove_column :gem_uses, :gem_version_id
    add_column :gem_uses,  :versioned_gem_id, :integer
  end
end
