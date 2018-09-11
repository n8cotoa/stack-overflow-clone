class CreateJoinTableUsersResponses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :responses do |t|
      t.column :votes, :integer
    end
  end
end
