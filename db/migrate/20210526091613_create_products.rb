class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :product_name
      t.integer :genre_id
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.boolean :is_sale, default: true
      t.timestamps
    end
  end
end
