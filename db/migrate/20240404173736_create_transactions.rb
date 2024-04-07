class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :subject
      t.string :channel_id
      t.string :biz_number
      t.string :transaction_id,null: true
      t.string :accountant_id,null: true
      t.string :caption_id,null: true
      t.string :billing_address_id
      t.text :proof,null: true
      t.timestamps
    end
  end
end
