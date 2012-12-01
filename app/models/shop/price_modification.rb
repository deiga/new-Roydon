class Shop::PriceModification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :value, :type => Float

  def percentage
    (self.value+100)/100
  end
end
