class Show
	include Mongoid::Document
	include Mongoid::Timestamps
	include ActiveModel::ForbiddenAttributesProtection
  extend Caching

	field :title, 		type: String
	field :url, 			type: String
	field :location, 	type: String
	field :duration, 	type: Integer, default: 1
	field :date, 			type: Date
	field :passive,		type: Boolean, default: false

	index date: 1

	scope :active, -> { where(passive: false) }
	scope :upcoming, -> { where(:date.gte => Date.today).active }
  scope :range, ->(from, to) { where(:date.gte => from, :date.lt => to).active }
  scope :earlier_this_year, -> { range(Date.today.beginning_of_year, Date.today) }
	default_scope -> { asc(:date) }

	# Validations
	url_regex = /\Ahttp\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?\z/i
	validates :title, :location, :date, presence: true
	validates :duration, numericality: { interger_only: true, greater_than_or_equal_to: 1 }
	validates :url , format: { with: url_regex, allow_nil: true }

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

  rails_admin do
    list do
        exclude_fields :_type, :_id, :created_at, :updated_at
        sort_by :date
        sort_reverse true
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
      end
  end

end
