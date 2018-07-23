class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name, limit: 255
      t.date :birth_date
      t.string :email, limit: 255
      t.string :website, limit: 255

      t.timestamps
    end
  end
end
