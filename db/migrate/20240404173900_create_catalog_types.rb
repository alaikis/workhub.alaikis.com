class CreateCatalogTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :catalog_types do |t|
      t.string :name
      t.text :brief
      t.string :code
      t.string :bind_resource
      t.column :ext,"json",default:"{}"
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
