class CreateGemInstances < ActiveRecord::Migration
  def change
    create_table :gem_instances do |t|
      t.string :name
      t.timestamps
    end
  end
end
