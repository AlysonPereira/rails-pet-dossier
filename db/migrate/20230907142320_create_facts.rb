class CreateFacts < ActiveRecord::Migration[7.0]
  def change
    create_table :facts do |t|
      t.string :content

      t.timestamps
    end
  end
end
