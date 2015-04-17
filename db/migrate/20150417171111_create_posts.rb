class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.date :day
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :categories
    add_foreign_key :posts, :users
    add_index :posts, [:category_id, :created_at]
  end
end
