class CreateManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.text :icon
      t.text :web_site,null:true
      t.text :brief
      t.string :telephone,null:true
      t.string :comm_type
      t.string :comm_account
      t.text :remark,null:true
      t.boolean :state,default:true
      t.timestamps
    end
  end
end
