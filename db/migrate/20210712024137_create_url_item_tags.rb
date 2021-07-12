class CreateUrlItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :url_item_tags do |t|
      t.references :url_item, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
