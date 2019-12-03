class RemoveUserIdFromSmartids < ActiveRecord::Migration[6.0]
  def change
    remove_column :smartids, :user_id, :integer
  end
end
