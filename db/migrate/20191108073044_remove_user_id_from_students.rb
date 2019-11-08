class RemoveUserIdFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :smart_id, :integer
  end
end
