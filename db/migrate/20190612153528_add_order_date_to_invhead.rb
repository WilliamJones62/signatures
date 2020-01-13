class AddOrderDateToInvhead < ActiveRecord::Migration[5.1]
  def change
    add_column :invheads, :order_date, :date
  end
end
