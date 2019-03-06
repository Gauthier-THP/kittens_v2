class AddAmountAndStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :amount, :decimal
    add_column :orders, :status, :string
  end
end
