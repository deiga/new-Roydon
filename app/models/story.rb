class Story
	include Mongoid::Document
	include Mongoid::Timestamps

	after_create :clear_cache
	after_update :clear_cache
	before_destroy :clear_cache

	field :title, 	:type => String
	field :date, 	:type => Date, :default => Date.today
	field :content, :type => String

	# Validations
	validates :title, :content, :presence => true
	validates :title, :content, :length => { :minimum => 3 }

	def format_date
		Time.parse(self.date.to_s).strftime('%d.%m.%Y')
	end

end
