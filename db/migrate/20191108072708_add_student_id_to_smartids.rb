class AddStudentIdToSmartids < ActiveRecord::Migration[6.0]
  def change
    add_column :smartids, :student_id, :integer
  end
end
