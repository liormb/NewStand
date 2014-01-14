class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.belongs_to :comment

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :group_id
    add_index :likes, :comment_id
  end
end
