class CreateGemUses < ActiveRecord::Migration
  def change
    create_table :gem_uses do |t|
      t.integer :gemfile_id
      t.integer :gem_version_id
      t.timestamps      
    end
  end
end
