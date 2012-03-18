class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :top_category
  has_and_belongs_to_many :products

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  validates :name, :presence => true, :length => { :minimum => 1 }
end
