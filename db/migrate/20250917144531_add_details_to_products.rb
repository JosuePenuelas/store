class AddDetailsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :price, :decimal
    add_column :products, :description, :text
    add_column :products, :image, :string
  end
end
