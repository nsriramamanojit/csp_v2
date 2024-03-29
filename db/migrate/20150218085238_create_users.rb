class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
#      t.integer   :role_id
      t.string    :name,                :null => false, :default => ''
      t.string    :login
      t.boolean   :status,:default=>1
      t.string    :mobile
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :email,               :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false

      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      #profile picture
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at


      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
