class AddMinicontentToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :minicontent, :string
  end
end
