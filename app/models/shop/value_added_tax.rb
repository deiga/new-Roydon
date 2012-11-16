class Shop::ValueAddedTax < Shop::PriceModification

  has_many :products, class_name: 'Shop::Product'

end
