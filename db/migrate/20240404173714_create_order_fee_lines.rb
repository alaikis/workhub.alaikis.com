class CreateOrderFeeLines < ActiveRecord::Migration[7.1]
  def change
    create_table :order_fee_lines do |t|
      t.belongs_to :order, null: false, foreign_key: { to_table: :orders }
      t.string :name
      t.string :code
      t.string :currency,default: "USD"
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.boolean :state, default: false
      t.timestamps
    end
  end
end
