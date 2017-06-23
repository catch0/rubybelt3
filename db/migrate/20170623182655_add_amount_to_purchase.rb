class AddAmountToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :amount, :decimal
  end
end
