class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, {null: false, foreign_key: { to_table: :orders }}
      t.references :item, { null: false, foreign_key: { to_table: :variants } }
      t.references :declare, { null: false, foreign_key: { to_table: :declares } }
      t.text :shop_order_line_id
      t.integer :quantity,default:1
      t.decimal :snap_sale_price,precision: 10,scale: 2
      t.decimal :price,precision: 10,scale: 2
      t.timestamps
    end
  end
end
