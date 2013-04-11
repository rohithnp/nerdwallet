desc "Import Securities"
task :import_securities => :environment do 
	json = ActiveSupport::JSON.decode(File.read('db/seeds/may30.json'))

	json.each do |s|
		puts Security.find_by_symbol(s["Security"]["Symbol"]).id
	end
end
