class CreateInvheads < ActiveRecord::Migration[5.2]
  def change
    create_table :invheads do |t|
      t.string :invoice_numb
      t.string :order_numb
      t.string :rel_numb
      t.string :cust_code

      t.timestamps
    end
  end
end
