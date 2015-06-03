class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.decimal :amount, :precision => 10, :scale => 2
      t.string :organization
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
