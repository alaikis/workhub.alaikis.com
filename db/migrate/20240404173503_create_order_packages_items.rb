class CreateOrderPackagesItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_packages_items do |t|
      t.belongs_to :pkg, null: false, foreign_key: { to_table: :order_packages }
      t.belongs_to :item, null: false, foreign_key: { to_table: :order_items }
      t.integer :quantity, null: false
      t.boolean :status,default: true
      t.timestamps
    end
  end
end
