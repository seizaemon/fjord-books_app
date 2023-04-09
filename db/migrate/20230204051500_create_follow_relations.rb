class CreateFollowRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relations do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
    add_index :follow_relations, :follower_id
    add_index :follow_relations, :followee_id
    add_index :follow_relations, %i(follower_id followee_id), unique: true
  end
end
