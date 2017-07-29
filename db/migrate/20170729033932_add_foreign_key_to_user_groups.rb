class AddForeignKeyToUserGroups < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :user_groups, :users, column: :user_id
    add_foreign_key :user_groups, :groups, column: :group_id
  end
end
