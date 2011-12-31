class Show
	include MongoMapper::Document

	key :title, String
	key :url, String
	key :location, String
	key :duration, Integer, :default => 1
	key :date, Date
	timestamps!

	# Validations
	validates :title, :url, :location, :date, :presence => true
	validates :duration, :numericality => { :interger_only => true, 
		:greater_than_or_equal_to => 1 }
	validates :url , :format => { 
		:with => /^http\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/i}
end