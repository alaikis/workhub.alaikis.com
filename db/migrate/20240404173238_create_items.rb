class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.text :title,null:false
      t.string :catalog_id, index: true
      t.string :shop_id, index: true
      t.string :brand_id, index: true
      t.string :item_type_id, index: true
      t.column :images_mapping, "json", default: "{}"
      t.text :videos
      t.integer :mqq,default: 1, null: false
      t.string :locale, default: "en-us", null: false
      t.string :currency, default: "USD", null: false
      t.string :country, default: "US", null: false
      t.string :language, default: "en", null: false
      t.string :mpn,null:false
      t.string :gtin,null:true
      t.string :shop_sku,null:false
      t.text :height_lings
      t.text :description
      t.boolean :state,default:true
      t.json :attributes, default: "{}"
      t.json :meta,default: "{}"
      t.timestamps
    end
  end
end
