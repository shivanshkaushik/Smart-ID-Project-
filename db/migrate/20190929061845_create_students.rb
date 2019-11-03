class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :enrollnumber
      t.string :firstname
      t.string :lastname
      t.string :branch
      t.string :batch
      t.integer :contact
      t.timestamps
    end
  end
end
