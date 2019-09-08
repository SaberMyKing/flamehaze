class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :area_id, null: false
      t.belongs_to :province, index: true

      t.timestamps null: false
    end

    add_index :cities, :name
    add_index :cities, :area_id
  end
end
