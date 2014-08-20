class AddNameToGemfile < ActiveRecord::Migration
  def change
    add_column :gemfiles, :name, :string
  end
end
