class Story
	include Mongoid::Document
	include Mongoid::Timestamps

	field :title, 		:type => String
	field :date, 			:type => Date, 		:default => Date.today
	field :content, 	:type => String
	field :language,	:type => String,	:default => "fi"

	# Validations
	validates :title, :content, :presence => true
	validates :title, :content, :length => { :minimum => 3 }

	def format_date
		Time.parse(self.date.to_s).strftime('%d.%m.%Y')		
	end
end