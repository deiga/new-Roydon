class Shop::PriceModification
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  field :name, type: String
  field :value, type: Float, default: 0.0

  validates :name, presence: true, length: { minimum: 2 }
  validates :value, numericality: { minimum: 0.0, maximum: 100.0 }

  def add_percentage
    (self.value+100)/100
  end

  def subtract_percentage
    (100-self.value)/100
  end

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end
end
