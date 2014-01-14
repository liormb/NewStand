class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin_id
      t.string :source
      t.string :article_url
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
