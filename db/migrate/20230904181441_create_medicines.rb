class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.float :dosage
      t.integer :period
      t.string :unit
      t.date :start_date
      t.date :end_date
      t.references :dossier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
