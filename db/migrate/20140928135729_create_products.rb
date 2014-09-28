class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false
      t.text :desc
      t.decimal :price, precision: 5, scale: 2
      t.string :image
      t.references :product_type, index: true

      t.timestamps
    end
    add_index :products, :name
  end
end
