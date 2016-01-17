class CreateAdminAlerts < ActiveRecord::Migration
  def change
    create_table :admin_alerts do |t|
      t.text :description
      t.integer :category
      t.string :email
      t.decimal :price, precision: 8, scale: 2
      t.datetime :deadline
      t.integer :status

      t.timestamps null: false
    end
  end
end
