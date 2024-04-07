class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :name
      t.string :usage
      t.string :space
      t.text :value
      t.boolean :json_object,default:false
      t.timestamps
    end
  end
end
