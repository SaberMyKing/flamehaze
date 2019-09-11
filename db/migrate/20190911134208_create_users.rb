class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, index: true
      t.string :nickname
      t.string :avatar
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
