class UpdateJoinTableForUsersAndResponses < ActiveRecord::Migration[5.2]
  def change
    rename_table :responses_users, :votes
    rename_column :votes, :votes, :count
  end
end
