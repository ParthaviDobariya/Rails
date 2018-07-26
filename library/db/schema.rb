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

ActiveRecord::Schema.define(version: 2018_07_23_073156) do

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "email"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.bigint "librarian_id"
    t.date "issue_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_issues_on_book_id"
    t.index ["librarian_id"], name: "index_book_issues_on_librarian_id"
    t.index ["user_id"], name: "index_book_issues_on_user_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "isbn_no", limit: 13
    t.string "title"
    t.integer "number_of_books"
    t.date "publish_date"
    t.bigint "pages"
    t.bigint "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_books_on_publication_id"
  end

  create_table "books_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_authors_on_author_id"
    t.index ["book_id"], name: "index_books_authors_on_book_id"
  end

  create_table "books_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "librarians", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "mobile_no", limit: 15
    t.string "address", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_librarians_on_email", unique: true
    t.index ["reset_password_token"], name: "index_librarians_on_reset_password_token", unique: true
  end

  create_table "publications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address", limit: 1000
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "mobile_no", limit: 15
    t.string "email"
    t.string "address", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_issues", "books"
  add_foreign_key "book_issues", "librarians"
  add_foreign_key "book_issues", "users"
  add_foreign_key "books", "publications"
  add_foreign_key "books_authors", "authors"
  add_foreign_key "books_authors", "books"
  add_foreign_key "books_categories", "books"
  add_foreign_key "books_categories", "categories"
end
