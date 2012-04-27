class UserGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String

  has_and_belongs_to_many :users
  has_many :discounts
end
