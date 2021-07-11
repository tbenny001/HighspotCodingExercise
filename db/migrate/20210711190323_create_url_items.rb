class CreateUrlItems < ActiveRecord::Migration[6.1]
  def change
    create_table :url_items do |t|
      t.string :url
      t.string :name
      t.string :description
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
