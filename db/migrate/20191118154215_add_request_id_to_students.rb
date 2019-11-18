class AddRequestIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :request_id, :integer, default: nil
  end
end
