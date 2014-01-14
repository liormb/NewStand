class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
    add_index :users_groups, :user_id
    add_index :users_groups, :group_id
  end
end
