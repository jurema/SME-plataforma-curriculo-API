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

ActiveRecord::Schema.define(version: 2018_12_17_201742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "sequence"
    t.string "title"
    t.integer "estimated_time"
    t.jsonb "content"
    t.bigint "activity_sequence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.integer "environment"
    t.integer "status", default: 0
    t.index ["activity_sequence_id"], name: "index_activities_on_activity_sequence_id"
    t.index ["slug"], name: "index_activities_on_slug", unique: true
  end

  create_table "activities_activity_types", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "activity_type_id", null: false
    t.index ["activity_id", "activity_type_id"], name: "idx_act_act_types_on_activity_id_and_activity_type_id"
    t.index ["activity_type_id", "activity_id"], name: "idx_act_act_types_on_activity_type_id_and_activity_id"
  end

  create_table "activities_curricular_components", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "curricular_component_id", null: false
    t.index ["activity_id", "curricular_component_id"], name: "index_activity_component_on_activity_id_and_component_id"
    t.index ["curricular_component_id", "activity_id"], name: "index_activity_component_on_component_id_and_activity_id"
  end

  create_table "activities_learning_objectives", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "learning_objective_id", null: false
    t.index ["activity_id", "learning_objective_id"], name: "idx_activity_learning_on_activity_id_and_lo_id"
    t.index ["learning_objective_id", "activity_id"], name: "idx_activity_learning_on_lo_id_and_activity_id"
  end

  create_table "activity_content_blocks", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "content_block_id"
    t.integer "sequence"
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_content_blocks_on_activity_id"
    t.index ["content_block_id"], name: "index_activity_content_blocks_on_content_block_id"
  end

  create_table "activity_sequences", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.text "presentation_text"
    t.jsonb "books"
    t.integer "estimated_time"
    t.integer "status"
    t.bigint "main_curricular_component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.string "keywords"
    t.index ["main_curricular_component_id"], name: "index_activity_sequences_on_main_curricular_component_id"
    t.index ["slug"], name: "index_activity_sequences_on_slug", unique: true
  end

  create_table "activity_sequences_knowledge_matrices", id: false, force: :cascade do |t|
    t.bigint "activity_sequence_id", null: false
    t.bigint "knowledge_matrix_id", null: false
    t.index ["activity_sequence_id", "knowledge_matrix_id"], name: "idx_activity_seq_knowledge_on_activity_id_and_knowledge_id"
    t.index ["knowledge_matrix_id", "activity_sequence_id"], name: "idx_activity_seq_knowledge_on_knowledge_id_and_activity_id"
  end

  create_table "activity_sequences_learning_objectives", id: false, force: :cascade do |t|
    t.bigint "activity_sequence_id", null: false
    t.bigint "learning_objective_id", null: false
    t.index ["activity_sequence_id", "learning_objective_id"], name: "idx_activity_seq_learning_on_activity_seq_id_and_lo_id"
    t.index ["learning_objective_id", "activity_sequence_id"], name: "idx_activity_seq_learning_on_lo_id_and_activity_seq_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axes", force: :cascade do |t|
    t.string "description"
    t.bigint "curricular_component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curricular_component_id"], name: "index_axes_on_curricular_component_id"
  end

  create_table "axes_learning_objectives", id: false, force: :cascade do |t|
    t.bigint "learning_objective_id", null: false
    t.bigint "axis_id", null: false
  end

  create_table "collection_activity_sequences", force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "activity_sequence_id"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_sequence_id"], name: "index_collection_activity_sequences_on_activity_sequence_id"
    t.index ["collection_id"], name: "index_collection_activity_sequences_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_collections_on_teacher_id"
  end

  create_table "content_blocks", force: :cascade do |t|
    t.integer "content_type"
    t.jsonb "json_schema", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curricular_components", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.string "color"
    t.index ["slug"], name: "index_curricular_components_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "goals", force: :cascade do |t|
    t.text "description"
    t.bigint "sustainable_development_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sustainable_development_goal_id"], name: "index_goals_on_sustainable_development_goal_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "subtitle"
    t.bigint "activity_content_block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_content_block_id"], name: "index_images_on_activity_content_block_id"
  end

  create_table "knowledge_matrices", force: :cascade do |t|
    t.string "title"
    t.text "know_description"
    t.text "for_description"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_objectives", force: :cascade do |t|
    t.integer "year"
    t.string "code"
    t.string "description"
    t.bigint "curricular_component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curricular_component_id"], name: "index_learning_objectives_on_curricular_component_id"
  end

  create_table "learning_objectives_sustainable_development_goals", id: false, force: :cascade do |t|
    t.bigint "sustainable_development_goal_id", null: false
    t.bigint "learning_objective_id", null: false
    t.index ["learning_objective_id", "sustainable_development_goal_id"], name: "index_sdg_lo_on_lo_id_asdg_id"
    t.index ["sustainable_development_goal_id", "learning_objective_id"], name: "index_sdg_lo_on_sdg_id_alo_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sustainable_development_goals", force: :cascade do |t|
    t.integer "sequence"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "nickname"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "uid"
    t.string "name"
    t.string "last_name"
    t.string "session_index"
    t.string "provider", default: "email", null: false
    t.string "nickname"
    t.json "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "activities", "activity_sequences"
  add_foreign_key "activity_content_blocks", "activities"
  add_foreign_key "activity_content_blocks", "content_blocks"
  add_foreign_key "activity_sequences", "curricular_components", column: "main_curricular_component_id"
  add_foreign_key "axes", "curricular_components"
  add_foreign_key "collection_activity_sequences", "activity_sequences"
  add_foreign_key "collection_activity_sequences", "collections"
  add_foreign_key "collections", "teachers"
  add_foreign_key "goals", "sustainable_development_goals"
  add_foreign_key "images", "activity_content_blocks"
  add_foreign_key "learning_objectives", "curricular_components"
  add_foreign_key "teachers", "users"
end
