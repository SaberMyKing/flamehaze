class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name, null: false
      t.integer :area_id, null: false
      t.belongs_to :city, index: true

      t.timestamps null: false
    end

    add_index :districts, :name
    add_index :districts, :area_id
  end
end
