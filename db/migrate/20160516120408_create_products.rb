class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :location
      t.string :platform, null: false

      t.timestamps null: false
    end

    add_reference :products, :user, type: :uuid, null: false, index: true
  end
end
