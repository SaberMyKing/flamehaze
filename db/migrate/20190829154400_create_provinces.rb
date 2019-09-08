class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name, null: false
      t.integer :area_id, null: false

      t.timestamps null: false
    end

    add_index :provinces, :name
    add_index :provinces, :area_id
  end
end
