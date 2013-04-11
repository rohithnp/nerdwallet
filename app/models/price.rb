class Price < ActiveRecord::Base
  attr_accessible :cummulativeCashDividend, :cummulativeStockDividendRatio, :date, :delay, :high, :lastClose, :low, :open, 
  				  :volume,:security_id,:last, :changeFromLastClose
  belongs_to :security
end
