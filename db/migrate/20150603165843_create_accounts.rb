class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :transfer

      t.timestamps null: false
    end
  end
end
