class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 255
      t.string :mobile_no, limit: 15
      t.string :email, limit: 255
      t.string :address, limit: 1000

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :mobile_no, unique: true
    add_index :users, :email, unique: true
  end
end
