class Story
	include Mongoid::Document
	include Mongoid::Timestamps
	include ActiveModel::ForbiddenAttributesProtection
  extend Shop::Caching

	field :title, 		:type => String
	field :date, 			:type => Date, 		:default => Date.today
	field :content, 	:type => String
	field :language,	:type => String,	:default => "fi"
	field :passive,		type: Boolean,		default: false

	index date: 1

  scope :active, where(passive: false)
  scope :newest, lambda { where( :date.gte => Date.today.prev_month(3)).active }

	# Validations
	validates :title, :content, :presence => true
	validates :title, :content, :length => { :minimum => 3 }

	def format_date
		Time.parse(self.date.to_s).strftime('%d.%m.%Y')
	end

end
