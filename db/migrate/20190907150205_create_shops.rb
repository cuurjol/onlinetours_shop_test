class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :metro
      t.string :city

      t.timestamps
    end
  end
end
