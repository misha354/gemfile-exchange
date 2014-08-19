class CreateGemfiles < ActiveRecord::Migration
  def change
    create_table :gemfiles do |t|
      t.integer :user_id
      t.text :source
      t.timestamps
    end
  end
end
