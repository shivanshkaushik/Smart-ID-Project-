class AddRegistrationNumberToSmartids < ActiveRecord::Migration[6.0]
  def change
    add_column :smartids, :registration_number, :integer
  end
end
