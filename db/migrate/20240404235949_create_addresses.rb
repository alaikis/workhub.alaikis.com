class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :name,null:true
      t.text :first_name
      t.text :last_name
      t.text :email,null:true
      t.string :tel,null:true
      t.string :country_code
      t.string :province,null:true
      t.string :province_code,null:true
      t.string :city
      t.string :suburbs,null:true
      t.string :address1
      t.string :address2,null:true
      t.string :address3,null:true
      t.string :zipcode,null:true
      t.boolean :primary,default:true
      t.timestamps
    end
  end
end
