class GroupDiscount
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name , :type => String
  field :discount, :type => Float
  field :amount_needed, :type => Integer
  
  has_many :products
  belongs_to :user
  belongs_to :promotion
end
