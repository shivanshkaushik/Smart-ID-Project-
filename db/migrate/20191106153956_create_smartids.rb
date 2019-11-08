class CreateSmartids < ActiveRecord::Migration[6.0]
  def change
    create_table :smartids do |t|
      t.integer :user_id
      t.decimal :balance, :precision => 6, :scale => 2
      t.decimal :last_transaction, :precision => 6, :scale => 2
      t.integer :dues
    end
  end
end
