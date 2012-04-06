class TopCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  has_many :categories

  validates :name, :presence => true, :length => { :minimum => 1 }

  before_save do |top_category|
    top_category.name.gsub!(/\s/,'&nbsp;')
  end
end
