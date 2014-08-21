class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :gemfile_id
      t.string :timestamps
      t.boolean :vote
    end
  end
end
