class DateTimeValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    puts "\nDTV - self: #{self.inspect}\n"
    puts "\nDTV - options: #{options.inspect}\n"
    false
  end
end

class Shop::Promotion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :passive, type: Boolean, default: false

  has_one :discount, class_name: 'Shop::Discount'

  validates :name, presence: true, length: { minimum: 1}
  validates :start_date, date_time: { in_future: true }
  validates :end_date, date_time: { after: :start_date }

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end
end
