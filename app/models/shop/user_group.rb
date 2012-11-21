class Shop::UserGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  GROUP_TYPES = ['admin', 'breeder', 'groomer']

  field :name, :type => String

  validates :name, presence: true, inclusion: GROUP_TYPES, uniqueness: true

  has_and_belongs_to_many :users
  has_many :discounts, class_name: 'Shop::Discount'
end
