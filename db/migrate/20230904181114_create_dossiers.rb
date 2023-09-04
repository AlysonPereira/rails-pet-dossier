class CreateDossiers < ActiveRecord::Migration[7.0]
  def change
    create_table :dossiers do |t|
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
