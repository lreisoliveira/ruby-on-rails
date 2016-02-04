# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160107174643) do

  create_table "admin", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "login",      limit: 255
    t.string   "senha",      limit: 255
    t.boolean  "vigente"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "alternativas", force: :cascade do |t|
    t.integer  "pergunta_id", limit: 4
    t.string   "descricao",   limit: 255
    t.boolean  "correto"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "alternativas", ["pergunta_id"], name: "index_alternativas_on_pergunta_id", using: :btree

  create_table "participantes", force: :cascade do |t|
    t.integer  "re",         limit: 4
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "participantes_alternativas", force: :cascade do |t|
    t.integer "participante_id", limit: 4
    t.integer "alternativa_id",  limit: 4
  end

  add_index "participantes_alternativas", ["alternativa_id"], name: "index_participantes_alternativas_on_alternativa_id", using: :btree
  add_index "participantes_alternativas", ["participante_id"], name: "index_participantes_alternativas_on_participante_id", using: :btree

  create_table "participantes_questionarios", force: :cascade do |t|
    t.integer "participante_id", limit: 4
    t.integer "questionario_id", limit: 4
  end

  add_index "participantes_questionarios", ["participante_id"], name: "index_participantes_questionarios_on_participante_id", using: :btree
  add_index "participantes_questionarios", ["questionario_id"], name: "index_participantes_questionarios_on_questionario_id", using: :btree

  create_table "perguntas", force: :cascade do |t|
    t.integer  "questionario_id", limit: 4
    t.string   "descricao",       limit: 255
    t.string   "video",           limit: 255
    t.boolean  "vigente"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "perguntas", ["questionario_id"], name: "index_perguntas_on_questionario_id", using: :btree

  create_table "questionarios", force: :cascade do |t|
    t.string   "nome",            limit: 255
    t.date     "vigencia_inicio"
    t.date     "vigencia_fim"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "alternativas", "perguntas"
  add_foreign_key "participantes_alternativas", "alternativas"
  add_foreign_key "participantes_alternativas", "participantes"
  add_foreign_key "participantes_questionarios", "participantes"
  add_foreign_key "participantes_questionarios", "questionarios"
  add_foreign_key "perguntas", "questionarios"
end
