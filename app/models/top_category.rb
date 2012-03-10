class TopCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  embeds_many :categories

  validates :name, :presence => true
end
