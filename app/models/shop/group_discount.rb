class Shop::GroupDiscount
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  has_and_belongs_to_many :products, class_name: 'Shop::Product', inverse_of: nil
  has_many :categories, class_name: 'Shop::Category'

  field :name, type: String
  field :scheme, type: Hash

  validates :name, presence: true
end
