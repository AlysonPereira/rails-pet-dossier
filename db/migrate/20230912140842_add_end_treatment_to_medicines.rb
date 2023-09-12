class AddEndTreatmentToMedicines < ActiveRecord::Migration[7.0]
  def change
    add_column :medicines, :end_treatment, :boolean, default: false
  end
end
