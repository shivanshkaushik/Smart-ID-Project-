class RemoveRequestIdFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :request_id, :integer
  end
end
