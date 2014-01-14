class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.text :content

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :group_id
  end
end
