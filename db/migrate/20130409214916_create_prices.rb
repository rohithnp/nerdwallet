class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.date :date
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.integer :volume
      t.decimal :lastClose
      t.decimal :last
      t.decimal :cummulativeCashDividend
      t.integer :cummulativeStockDividendRatio
      t.decimal :delay
      t.integer :security_id
      t.decimal :changeFromLastClose


      t.timestamps
    end
  end
end
