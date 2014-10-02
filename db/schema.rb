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

ActiveRecord::Schema.define(version: 20141001175059) do

  create_table "articulos", force: true do |t|
    t.string   "title"
    t.integer  "tipo"
    t.string   "tiempo_preparacion"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comandas", force: true do |t|
    t.integer  "articulo_id"
    t.integer  "order_id"
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
  end

end
