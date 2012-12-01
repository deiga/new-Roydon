class Shop::PriceModification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :value, :type => Float

  def add_percentage
    (self.value+100)/100
  end

  def substract_percentage
    (100-self.value)/100
  end
end
