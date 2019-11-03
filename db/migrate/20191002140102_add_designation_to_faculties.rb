class AddDesignationToFaculties < ActiveRecord::Migration[6.0]
  def change
    add_column :faculties, :designation, :string
  end
end
