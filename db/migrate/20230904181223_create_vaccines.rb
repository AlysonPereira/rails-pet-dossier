class CreateVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.date :vaccination_date
      t.date :next_vaccination
      t.references :dossier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
