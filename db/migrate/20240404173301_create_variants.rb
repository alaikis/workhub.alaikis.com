class CreateVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :variants do |t|
      t.belongs_to :item, index: true
      t.column :attribute, "json", default: "{}"
      t.string :sku,null:false
      t.string :barcode,null:true
      t.string :image,null:true
      t.string :shop_sku,null:false
      t.string :gtin,null:true
      t.decimal :weight,precision: 10,scale: 3,null:false
      t.decimal :length,precision: 10,scale: 3,null:false
      t.decimal :width,precision: 10,scale: 3,null:false
      t.decimal :height,precision: 10,scale: 3,null:false
      t.string :weight_unit,null:false,default: "g"
      t.string :length_unit,null:false,default: "cm"
      t.decimal :suggest_price,precision: 10,scale: 2
      t.decimal :sale_price,precision: 10,scale: 2,null:false
      t.timestamps
    end
  end
end
