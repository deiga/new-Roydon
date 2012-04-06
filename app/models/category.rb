class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  has_ancestry
  has_and_belongs_to_many :products

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  validates :name, :presence => true, :length => { :minimum => 2 }

  def top_categories
    Category.all(:ancestry => nil)
  end
end
