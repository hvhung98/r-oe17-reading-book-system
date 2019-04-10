<<<<<<< HEAD
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

ActiveRecord::Schema.define(version: 20190410092625) do

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", default: 0
    t.boolean "status", default: true
    t.string "provider"
  end

=======
ActiveRecord::Schema.define(version: 20190410070716) do

  create_table "author", primary_key: "author_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.index ["author_id"], name: "author_id_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book", primary_key: "book_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.string "name", limit: 45, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "status", limit: 45, default: "0", null: false
    t.index ["book_id"], name: "book_id_UNIQUE", unique: true
    t.index ["category_id"], name: "fk_book_category_idx"
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "name"
    t.boolean "status", default: false
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category", primary_key: "category_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.index ["category_id"], name: "category_id_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "chapter", primary_key: "chapter_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.string "name", limit: 45, null: false
    t.text "content", limit: 4294967295, null: false
    t.index ["book_id"], name: "fk_chapter_book_idx"
    t.index ["chapter_id"], name: "chapter_id_UNIQUE", unique: true
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "book_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "comment", primary_key: "comment_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.text "content", limit: 255
    t.index ["book_id"], name: "fk_user_has_book_book3_idx"
    t.index ["comment_id"], name: "comment_id_UNIQUE", unique: true
    t.index ["user_id"], name: "fk_user_has_book_user2_idx"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follow", primary_key: ["user_id", "category_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "fk_user_has_category_category1_idx"
    t.index ["user_id"], name: "fk_user_has_category_user1_idx"
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_follows_on_category_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "content"
    t.string "activity_type"
    t.integer "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "history", primary_key: "history_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.string "content", limit: 200, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["history_id"], name: "history_id_UNIQUE", unique: true
    t.index ["user_id"], name: "fk_history_user_idx"
  end

  create_table "like", primary_key: ["user_id", "book_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "fk_user_has_book_book_idx"
    t.index ["user_id"], name: "fk_user_has_book_user_idx"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_likes_on_book_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user", primary_key: "user_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.string "email", limit: 45, null: false
    t.string "password", limit: 30, null: false
    t.string "role_user", limit: 20, default: "normal", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["user_id"], name: "user_id_UNIQUE", unique: true
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "role_id"
    t.string "name"
    t.string "email"
    t.string "status", default: "normal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "view", primary_key: ["user_id", "book_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "fk_user_has_book_book2_idx"
    t.index ["user_id"], name: "fk_user_has_book_user1_idx"
  end

  create_table "written_bies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "author_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_written_bies_on_author_id"
    t.index ["book_id"], name: "index_written_bies_on_book_id"
  end

  create_table "writtent_by", primary_key: ["book_id", "author_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "fk_book_has_author_author1_idx"
    t.index ["book_id"], name: "fk_book_has_author_book1_idx"
  end

  add_foreign_key "book", "category", primary_key: "category_id", name: "fk_book_category", on_update: :cascade
  add_foreign_key "books", "categories"
  add_foreign_key "books", "users"
  add_foreign_key "chapter", "book", primary_key: "book_id", name: "fk_chapter_book"
  add_foreign_key "chapters", "books"
  add_foreign_key "comment", "book", primary_key: "book_id", name: "fk_user_has_book_book3", on_update: :cascade
  add_foreign_key "comment", "user", primary_key: "user_id", name: "fk_user_has_book_user2", on_update: :cascade
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "users"
  add_foreign_key "follow", "category", primary_key: "category_id", name: "fk_user_has_category_category1"
  add_foreign_key "follow", "user", primary_key: "user_id", name: "fk_user_has_category_user1"
  add_foreign_key "follows", "categories"
  add_foreign_key "follows", "users"
  add_foreign_key "histories", "users"
  add_foreign_key "history", "user", primary_key: "user_id", name: "fk_history_user", on_update: :cascade
  add_foreign_key "like", "book", primary_key: "book_id", name: "fk_user_has_book_book"
  add_foreign_key "like", "user", primary_key: "user_id", name: "fk_user_has_book_user"
  add_foreign_key "likes", "books"
  add_foreign_key "likes", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "view", "book", primary_key: "book_id", name: "fk_user_has_book_book2"
  add_foreign_key "view", "user", primary_key: "user_id", name: "fk_user_has_book_user1"
  add_foreign_key "written_bies", "authors"
  add_foreign_key "written_bies", "books"
  add_foreign_key "writtent_by", "author", primary_key: "author_id", name: "fk_book_has_author_author1"
  add_foreign_key "writtent_by", "book", primary_key: "book_id", name: "fk_book_has_author_book1"
>>>>>>> cbb8985f37cb571bba4536b814d193f5f6722788
end
