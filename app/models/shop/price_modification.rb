class Shop::PriceModification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :value, :type => Float, default: 0.0

  validates :name, presence: true, length: { minimum: 2 }
  validates :value, numericality: true

  def add_percentage
    (self.value+100)/100
  end

  def subtract_percentage
    (100-self.value)/100
  end
end
