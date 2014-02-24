class Shop::UserGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  # GROUP_TYPES = ['admin', 'breeder', 'groomer'] # TODO refactor these types somewhere else..

  field :name, :type => String

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :users
  has_many :discounts, class_name: 'Shop::Discount'

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end
end
