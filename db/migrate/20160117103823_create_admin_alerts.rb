class CreateAdminAlerts < ActiveRecord::Migration
  def change
    create_table :admin_alerts do |t|
      t.text :description
      t.integer :category
      t.string :email
      t.float :price
      t.datetime :deadline
      t.integer :status

      t.timestamps null: false
    end
  end
end
