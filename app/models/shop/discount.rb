class Shop::Discount < Shop::PriceModification
  has_many :products
  has_many :categories
  belongs_to :user_group
  belongs_to :promotion
end
