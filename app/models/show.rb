class Show
	include Mongoid::Document
	include Mongoid::Timestamps
	include ActiveModel::ForbiddenAttributesProtection

	field :title, 		:type => String
	field :url, 			:type => String
	field :location, 	:type => String
	field :duration, 	:type => Integer, :default => 1
	field :date, 			:type => Date
	field :passive,		type: Boolean, default: false

	index date: 1

	scope :active, lambda { where(passive: false) }
	scope :upcoming, lambda { where(:date.gte => Date.today).active }
  scope :range, (lambda do |from, to|
      where(:date.gte => from, :date.lt => to).active
    end)
  scope :earlier_this_year, lambda { range(Date.today.beginning_of_year, Date.today) }
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
			unless (self.date.next_month.at_beginning_of_month - 1) == self.date
				date_string = time.strftime('%d.')
			end

			date_string << '-'
			date_string << time.next_day(self.duration-1).strftime('%d.%m.')
		end
		date_string
	end

  def self.cache_key
    require 'digest/md5'
    Digest::MD5.hexdigest "#{max(:updated_at)}.try(:to_i)-#{count}"
  end

end
