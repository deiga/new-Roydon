class Story
	include Mongoid::Document
	include Mongoid::Timestamps
	include ActiveModel::ForbiddenAttributesProtection

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

  def self.cache_key
    require 'digest/md5'
    Digest::MD5.hexdigest "#{max(:updated_at)}.try(:to_i)-#{count}"
  end

end
