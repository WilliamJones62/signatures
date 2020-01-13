class CreateSignedInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :signed_invoices do |t|
      t.string :invoice_numb
      t.string :order_numb

      t.timestamps
    end
  end
end
