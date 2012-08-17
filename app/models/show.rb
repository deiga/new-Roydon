class Show
	include Mongoid::Document
	include Mongoid::Timestamps

	after_create :clear_cache
  after_update :clear_cache
  before_destroy :clear_cache

	field :title, 		:type => String
	field :url, 			:type => String
	field :location, 	:type => String
	field :duration, 	:type => Integer, :default => 1
	field :date, 			:type => Date

	default_scope asc(:date)

	# Validations
	url_regex = /\Ahttp\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?\z/i
	validates :title, :location, :date, :presence => true
	validates :duration, :numericality => { :interger_only => true, :greater_than_or_equal_to => 1 }
	validates :url , :format => { :with => url_regex, :allow_nil => true }

	def format_date
		time = Date.parse(self.date.to_s)
		date_string = time.strftime('%d.%m.')
		if self.duration > 1
			unless (Date.parse(self.date.year.to_s + "-" + (self.date.month + 1).to_s + "-01") - 1) == self.date
				date_string = time.strftime('%d.')
			end

			date_string << '-'
			date_string << time.next_day(self.duration-1).strftime('%d.%m.')
		end
		date_string
	end

	private

		def clear_cache
			ActionController::Base.new.expire_page controller: 'pages', action: 'index'
			ActionController::Base.new.expire_page controller: 'shows', action: 'index'
		end
end