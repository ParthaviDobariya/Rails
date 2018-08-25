class CreateBooksShops < ActiveRecord::Migration[5.2]
  def change
    create_table :books_shops do |t|
      t.references :book, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
