class Option
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :products

  field :name, :type => String
  field :values, :type => Array

  validates :name, :length => {:minimum => 3}
  validates :values, :length => {:minimum => 1}
end
