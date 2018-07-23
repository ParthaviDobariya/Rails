class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :name, limit: 255
      t.string :address, limit: 1000
      t.string :website, limit: 255

      t.timestamps
    end
  end
end
