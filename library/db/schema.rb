# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_20_124144) do

  create_table "authors", force: :cascade do |t|
    t.string "name", limit: 255
    t.date "birth_date"
    t.string "email", limit: 255
    t.string "website", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_authors_on_email", unique: true
    t.index ["name"], name: "index_authors_on_name", unique: true
  end

  create_table "book_issues", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.integer "librarian_id"
    t.date "issue_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_issues_on_book_id"
    t.index ["librarian_id"], name: "index_book_issues_on_librarian_id"
    t.index ["user_id"], name: "index_book_issues_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn_no", limit: 13
    t.string "title", limit: 255
    t.integer "number_of_books", limit: 4
    t.date "publish_date"
    t.integer "pages", limit: 5
    t.integer "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn_no"], name: "index_books_on_isbn_no", unique: true
    t.index ["publication_id"], name: "index_books_on_publication_id"
  end

  create_table "books_authors", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_authors_on_author_id"
    t.index ["book_id"], name: "index_books_authors_on_book_id"
  end

  create_table "books_categories", force: :cascade do |t|
    t.integer "book_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "librarians", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "mobile_no", limit: 15
    t.string "address", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_no"], name: "index_librarians_on_mobile_no", unique: true
    t.index ["name"], name: "index_librarians_on_name", unique: true
  end

  create_table "publications", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "address", limit: 1000
    t.string "website", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publications_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "mobile_no", limit: 15
    t.string "email", limit: 255
    t.string "address", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_no"], name: "index_users_on_mobile_no", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
