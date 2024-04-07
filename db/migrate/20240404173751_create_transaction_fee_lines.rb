class CreateTransactionFeeLines < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_fee_lines do |t|
      t.string :billing_id
      t.string :origin_line_id,null: true
      t.text :remark
      t.integer :quantity,default: 1
      t.decimal :value,precision: 10,scale: 2
      t.boolean :effect,default: false
      t.string :currency, default: "USD", null: false
      t.string :actual_currency, default: "USD", null: false
      t.decimal :actual_value,precision: 10,scale: 2,null: true
      t.timestamps
    end
  end
end
