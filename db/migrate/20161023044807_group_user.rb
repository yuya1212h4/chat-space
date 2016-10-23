class GroupUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :groups, :users
  end
end
