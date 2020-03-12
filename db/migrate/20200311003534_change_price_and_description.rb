class ChangePriceAndDescription < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, precision: 6, scale: 2
    change_column :products, :description, :text
  end
end
