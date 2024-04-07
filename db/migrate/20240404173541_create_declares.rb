class CreateDeclares < ActiveRecord::Migration[7.1]
  def change
    create_table :declares do |t|
      t.text :name
      t.text :name_locale
      t.string :item_id
      t.string :hs_code,null:true
      t.string :route_type,default:"country"
      t.decimal :weight,precision: 10,scale: 3,null:false
      t.decimal :length,precision: 10,scale: 3,null:false
      t.decimal :width,precision: 10,scale: 3,null:false
      t.decimal :height,precision: 10,scale: 3,null:false
      t.string :weight_unit,null:false,default: "g"
      t.string :length_unit,null:false,default: "cm"
      t.string :declare_currency,default: "USD"
      t.decimal :declare_value,precision: 10,scale: 2,null:false
      t.string :certificate_id,null:true
      t.string :document_id,null:true
      t.timestamps
    end
  end
end
