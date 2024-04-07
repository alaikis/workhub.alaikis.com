class CreateAuthorizes < ActiveRecord::Migration[7.1]
  def change
    create_table :authorizes do |t|
      t.string :name
      t.string :grant_id
      t.string :locale
      t.string :grant_type
      t.column :meta,"json",default:"{}"
      t.timestamps
    end
  end
end
