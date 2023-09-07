class AddRevaccinationPeriodToVaccines < ActiveRecord::Migration[7.0]
  def change
    add_column :vaccines, :revaccination_period, :string
  end
end
