# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

json_may30 = ActiveSupport::JSON.decode(File.read('db/seeds/may30.json'))
json_may31 = ActiveSupport::JSON.decode(File.read('db/seeds/may31.json'))
json_jun1 = ActiveSupport::JSON.decode(File.read('db/seeds/jun1.json'))

	json_may30.each do |s|

		#load all securities into DB, only need to run once
		Security.create!(:name => s["Security"]["Name"], :symbol =>s["Security"]["Symbol"])

		#create price entry for each security
		security_id = Security.find_by_symbol(s["Security"]["Symbol"]).id

		Price.create!(
			:cummulativeCashDividend => s["CummulativeCashDividend"], 
			:cummulativeStockDividendRatio => s["CummulativeStockDividendRatio"], 
			:date => Date.strptime(s["Date"], '%m/%d/%Y'), 
			:delay => s["Delay"],
			:high => s["High"], 
			:low => s["Low"], 
			:open => s["Open"], 
			:volume => s["Volume"], 
			:last => s["Last"],
			:lastClose => s["LastClose"],
			:security_id => security_id,
			:changeFromLastClose => s['ChangeFromLastClose']
		)
	end

	json_may31.each do |s|

		security_id = Security.find_by_symbol(s["Security"]["Symbol"]).id

		Price.create!(
			:cummulativeCashDividend => s["CummulativeCashDividend"], 
			:cummulativeStockDividendRatio => s["CummulativeStockDividendRatio"], 
			:date => Date.strptime(s["Date"], '%m/%d/%Y'), 
			:delay => s["Delay"],
			:high => s["High"], 
			:low => s["Low"], 
			:open => s["Open"], 
			:volume => s["Volume"], 
			:last => s["Last"],
			:lastClose => s["LastClose"],
			:security_id => security_id,
			:changeFromLastClose => s['ChangeFromLastClose']
		)
	end

	json_jun1.each do |s|

		security_id = Security.find_by_symbol(s["Security"]["Symbol"]).id
		
		Price.create!(
			:cummulativeCashDividend => s["CummulativeCashDividend"], 
			:cummulativeStockDividendRatio => s["CummulativeStockDividendRatio"], 
			:date => Date.strptime(s["Date"], '%m/%d/%Y'), 
			:delay => s["Delay"],
			:high => s["High"], 
			:low => s["Low"], 
			:open => s["Open"], 
			:volume => s["Volume"], 
			:last => s["Last"],
			:lastClose => s["LastClose"],
			:security_id => security_id,
			:changeFromLastClose => s['ChangeFromLastClose']
		)
	end