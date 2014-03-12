module Mall
  class DateTimeValidator < ActiveModel::EachValidator
    def validate_each(object, attribute, value)
      Rails.logger.debug "\nDTV - self: #{self.inspect}\n"
      Rails.logger.debug "\nDTV - options: #{options.inspect}\n"
      false
    end
  end

  class Promotion
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name, type: String
    field :start_date, type: DateTime
    field :end_date, type: DateTime
    field :passive, type: Boolean, default: false

    has_one :discount

    validates :name, presence: true, length: { minimum: 1}
    validates :start_date, date_time: { in_future: true }
    validates :end_date, date_time: { after: :start_date }

    rails_admin do
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end
  end
end
