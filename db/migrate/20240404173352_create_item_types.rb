class CreateItemTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :item_types do |t|
      t.string :name
      t.text :description
      t.string :image_primary_key
      t.text :attributes
      t.boolean :status,default:false
      t.timestamps
    end
  end
end
