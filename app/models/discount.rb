class Discount
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :amount, :type => Float

  has_many :products
  has_many :categories
  belongs_to :user_group
  belongs_to :promotion
end
