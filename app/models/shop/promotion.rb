class DateTimeValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    puts "DTV - self: #{self.inspect}"
    puts "DTV - options: #{options.inspect}"
    false
  end
end

class Shop::Promotion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :start_date, :type => DateTime
  field :end_date, :type => DateTime
  field :passive, :type => Boolean, :default => false

  has_one :discount, class_name: 'Shop::Discount'

  validates :name, :presence => true, :length => { :minimum => 1}
  validates :start_date, :date_time => { :in_future => true }
  validates :end_date, :date_time => { :after => :start_date }

end
