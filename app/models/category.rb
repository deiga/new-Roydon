class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :top_category
  has_and_belongs_to_many :products

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  validates :name, :presence => true
end
