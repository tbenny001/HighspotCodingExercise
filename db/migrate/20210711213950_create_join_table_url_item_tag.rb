class CreateJoinTableUrlItemTag < ActiveRecord::Migration[6.1]
  def change
    create_join_table :url_items, :tags do |t|
      t.index :url_item_id
      t.index :tag_id
    end
  end
end
