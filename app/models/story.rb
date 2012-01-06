class Story
	include MongoMapper::Document

	key :title, String
	key :date, Date, :default => Date.today
	key :content, String
	timestamps!

	# Validations
	validates :title, :content, :presence => true
	validates :title, :content, :length => { :minimum => 3 }

	def format_date
		Time.parse(self.date.to_s).strftime('%d.%m.%Y')		
	end
end