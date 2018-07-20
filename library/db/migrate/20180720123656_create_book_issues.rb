class CreateBookIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :book_issues do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.references :librarian, foreign_key: true
      t.date :issue_date
      t.date :return_date

      t.timestamps
    end
  end
end
