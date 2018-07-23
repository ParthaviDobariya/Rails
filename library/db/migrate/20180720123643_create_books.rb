class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn_no, limit: 13
      t.string :title, limit: 255
      t.integer :number_of_books, limit: 4
      t.date :publish_date
      t.integer :pages, limit: 5
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
