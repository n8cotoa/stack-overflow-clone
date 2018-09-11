class AddPermissionsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.column :permission, :string
    end 
  end
end
