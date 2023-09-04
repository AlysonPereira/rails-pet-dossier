class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :url
      t.string :local
      t.references :wish_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
