class ChangeUseridGroupidOptionsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :messages, :users, column: :user_id
    add_foreign_key :messages, :groups, column: :group_id
  end

  def change
    change_column_null :messages, :user_id, false
    change_column_null :messages, :group_id, false
  end
end
