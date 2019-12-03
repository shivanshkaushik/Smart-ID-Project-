class AddSmartIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :smart_id, :integer
  end
end
