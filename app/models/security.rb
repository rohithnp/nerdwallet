class Security < ActiveRecord::Base
  attr_accessible :name, :symbol
  has_many :prices
  validates_uniqueness_of :symbol
end
