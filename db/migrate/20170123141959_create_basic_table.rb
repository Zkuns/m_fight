class CreateBasicTable < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore'
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string  :email,              unique: true
      t.string  :phone,              unique: true
      t.string  :encrypted_password, null: false, default: ''
      t.string  :username
      t.integer :role
      t.string  :avatar

      t.timestamps                   null: false
    end
    add_index :users, %w(email phone), unique: true

    create_table :fight_records, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.uuid :winner_id
      t.uuid :fight_1_id
      t.uuid :fight_2_id
      t.json :fight_info

      t.timestamps             null: false
    end
    add_index :fight_records, %w(winner_id fight_1_id fight_2_id)
    
    create_table :authorizations, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.uuid   :user_id
      t.string :provider
      t.string :uid
      t.json   :login_info
      
      t.timestamps                   null: false
    end
    add_index :authorizations, %w(provider uid user_id)

  end
end
