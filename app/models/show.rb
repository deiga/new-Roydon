class Show
	include MongoMapper::Document

	key :title, String
	key :url, String
	key :location, String
	key :duration, Integer, :default => 1
	key :date, Date
	timestamps!

	# Validations
	validates_presence_of :title, :url, :location, :date
end