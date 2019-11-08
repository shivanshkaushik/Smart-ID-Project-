class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :contact
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: true
      t.timestamps
    end
  end
end
