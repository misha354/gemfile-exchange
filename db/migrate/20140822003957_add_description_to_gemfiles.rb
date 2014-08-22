class AddDescriptionToGemfiles < ActiveRecord::Migration
  def change
    add_column :gemfiles, :description, :string
  end
end
