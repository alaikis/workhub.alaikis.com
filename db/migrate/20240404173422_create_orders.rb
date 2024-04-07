class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :shop_order_number
      t.string :carrier_standard
      t.string :payment_method
      t.string :shop_id, index: true,null: true
      t.string :shipping_address_id, index: true,null: true
      t.string :billing_address_id, index: true,null: true
      t.string :transaction_id, index: true,null: true
      t.integer :progress,default: 0,null: false
      t.text :remark,null: true
      t.timestamps
    end
  end
end
