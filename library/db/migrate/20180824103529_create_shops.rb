class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, limit: 255
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end