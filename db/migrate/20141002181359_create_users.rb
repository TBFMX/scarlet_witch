class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #elementos creta
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :lastname
      t.string :email
      t.date :login_date
      t.date :password_date
      t.integer :rol_id
      #elementos cliente
      t.string :telefono
      t.string :calle
      t.string :colonia
      t.string :ciudad
      t.string :cp
      t.string :estado
     
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Ultima entrada
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end
end
