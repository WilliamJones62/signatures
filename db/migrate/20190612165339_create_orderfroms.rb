class CreateOrderfroms < ActiveRecord::Migration[5.1]
  def change
    create_table :orderfroms do |t|
      t.string :cust_code
      t.string :cust_status

      t.timestamps
    end
  end
end
