class CreateGasPrices < ActiveRecord::Migration
  def change
    create_table :gas_prices do |t|
      t.integer :postal_code
      t.string :price

      t.timestamps
    end
  end
end
