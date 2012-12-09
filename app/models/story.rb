class Story
	include Mongoid::Document
	include Mongoid::Timestamps

	field :title, 		:type => String
	field :date, 			:type => Date, 		:default => Date.today
	field :content, 	:type => String
	field :language,	:type => String,	:default => "fi"
	field :passive,		type: Boolean,		default: false

	index date: 1

	# Validations
	validates :title, :content, :presence => true
	validates :title, :content, :length => { :minimum => 3 }

	scope :active, where(passive: false)

	def format_date
		Time.parse(self.date.to_s).strftime('%d.%m.%Y')
	end

end
