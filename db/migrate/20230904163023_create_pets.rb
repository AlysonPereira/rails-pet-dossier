class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.string :breed
      t.date :dob
      t.float :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
