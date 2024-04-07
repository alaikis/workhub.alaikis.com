class CreateOrderPackages < ActiveRecord::Migration[7.1]
  def change
    create_table :order_packages do |t|
      t.belongs_to :order, null: false, foreign_key: { to_table: :orders }
      t.string :name
      t.string :carrier_id,null: true
      t.text :tracking_number,null: true
      t.text :exchange_number,null: true
      t.text :label,null: true
      t.decimal :length,precision: 10,scale: 3,null:false
      t.decimal :width,precision: 10,scale: 3,null:false
      t.decimal :height,precision: 10,scale: 3,null:false
      t.string :length_unit,null:false,default: "cm"
      t.timestamps
    end
  end
end
