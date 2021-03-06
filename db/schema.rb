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

ActiveRecord::Schema.define(version: 20141023202043) do

  create_table "articulos", force: true do |t|
    t.string   "title"
    t.integer  "tipo"
    t.string   "tiempo_preparacion"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comandas", force: true do |t|
    t.integer  "articulo_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historial_de_compras", force: true do |t|
    t.string   "nombre_generico"
    t.string   "description"
    t.string   "cantidad"
    t.string   "unidad"
    t.string   "precio"
    t.string   "multiplicador"
    t.integer  "subcategory_id"
    t.integer  "category_id"
    t.string   "origen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "nombre"
    t.string   "unidad"
    t.string   "yield"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "nombre"
    t.string   "unidad"
    t.integer  "consumible"
    t.integer  "disponibles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "client_id"
    t.datetime "fecha_pedido"
    t.string   "tipo_pago"
    t.string   "tipo_entrega"
    t.date     "fecha_entrega"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_id"
    t.string   "state"
    t.string   "amount"
    t.string   "calle"
    t.string   "colonia"
    t.string   "ciudad"
    t.string   "cp"
    t.string   "estado"
  end

  create_table "procedure_materials", force: true do |t|
    t.integer  "procidure_id"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.string   "nombre"
    t.string   "instrucciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.string   "porcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_procedures", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "procedure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rols", force: true do |t|
    t.string   "rol_name"
    t.boolean  "admin"
    t.boolean  "module_1"
    t.boolean  "module_2"
    t.boolean  "module_3"
    t.boolean  "module_4"
    t.boolean  "module_5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subrecipes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "subrecipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.date     "login_date"
    t.date     "password_date"
    t.integer  "rol_id"
    t.string   "telefono"
    t.string   "calle"
    t.string   "colonia"
    t.string   "ciudad"
    t.string   "cp"
    t.string   "estado"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_card_id"
    t.string   "credit_card_description"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
