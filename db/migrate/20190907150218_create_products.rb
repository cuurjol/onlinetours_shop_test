class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :vendor_code
      t.string :name
      t.integer :weight
      t.integer :size
      t.string :color
      t.integer :price

      t.timestamps
    end
  end
end
