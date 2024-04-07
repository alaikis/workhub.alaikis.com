class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :keywords
      t.text :meta_description
      t.text :remark
      t.string :catalog_types_id, index: true
      t.boolean :state,default: false
      t.timestamps
    end
  end
end
