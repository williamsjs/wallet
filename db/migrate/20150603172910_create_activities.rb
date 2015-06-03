class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.decimal :amount
      t.string :organization
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
