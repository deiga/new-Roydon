class Shop::UserGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String

  validates :name, presence: true, inclusion: { in: %w{admin breeder groomer}}, uniqueness: true

  has_and_belongs_to_many :users
  has_many :discounts
end
