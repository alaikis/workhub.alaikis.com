class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :manufacturer_id
      t.text :icon
      t.text :web_site,null:true
      t.text :brief
      t.boolean :state,default:true
      t.timestamps
    end
  end
end
