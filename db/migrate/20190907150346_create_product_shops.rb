class CreateProductShops < ActiveRecord::Migration[5.2]
  def change
    create_table :product_shops do |t|
      t.references :shop, foreign_key: false
      t.references :product, foreign_key: false
      t.integer :amount

      t.timestamps
    end
    add_index :product_shops, %i[shop_id product_id], unique: true
  end
end
