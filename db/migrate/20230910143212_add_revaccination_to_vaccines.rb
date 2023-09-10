class AddRevaccinationToVaccines < ActiveRecord::Migration[7.0]
  def change
    add_column :vaccines, :revaccination, :boolean, default: false
  end
end
