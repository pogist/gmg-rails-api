class AddImageToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :img_url

    add_column :users, :image, :string
    add_column :products, :image, :string
  end
end
