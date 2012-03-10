class TopCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :passive, :type => Boolean
  
  embeds_many :categories
end
