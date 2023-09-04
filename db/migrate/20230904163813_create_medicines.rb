class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.float :dosage
      t.string :unit
      t.integer :period
      t.date :start_date
      t.date :end_date
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
