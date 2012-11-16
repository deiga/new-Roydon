class Shop::PriceModification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :value, :type => Float
end
