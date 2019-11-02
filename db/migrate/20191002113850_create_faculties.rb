class CreateFaculties < ActiveRecord::Migration[6.0]
  def change
    create_table :faculties do |t|
      t.string :firstname
      t.string :lastname
      t.string :teaching_field
      t.integer :contact
      t.timestamps
    end
  end
end
