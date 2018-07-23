class CreateLibrarians < ActiveRecord::Migration[5.2]
  def change
    create_table :librarians do |t|
      t.string :name, limit: 255
      t.string :mobile_no, limit: 15
      t.string :address, limit: 1000

      t.timestamps
    end
  end
end
