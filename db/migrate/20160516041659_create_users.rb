class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest
      t.string :phone_number, default: "Not specified"
      t.string :location, null: false
      t.string :img_url, default: "path/to/images"

      t.timestamps null: false 
    end
  end
end
