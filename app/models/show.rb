class Show
	include Mongoid::Document
	include Mongoid::Timestamps

	field :title, type: String
	field :url, type: String
	field :location, type: String
	field :duration, type: Integer, default: 1
	field :date, type: Date

	# Validations
	url_regex = /\Ahttp\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?\z/i
	validates :title, :url, :location, :date, :presence => true
	validates :duration, :numericality => { :interger_only => true, 
		:greater_than_or_equal_to => 1 }
	validates :url , :format => { :with => url_regex }

	def format_date
		time = Time.parse(self.date.to_s)
		unless self.duration > 1
			date_string = time.strftime('%d.%m.')
		else
			date_string = time.strftime('%d.')
			date_string << '-'
			date_string << time.next_day(self.duration).strftime('%d.%m.')
		end

	end
end