class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.string :name
      t.integer :section
      t.date :date

      t.timestamps
    end
  end
end
