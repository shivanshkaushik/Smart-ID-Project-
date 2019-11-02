class AddEmailToFaculties < ActiveRecord::Migration[6.0]
  def change
    add_column :faculties, :email, :string
  end
end
