class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  has_ancestry
  has_and_belongs_to_many :products

  field :name, :type => String
  field :passive, :type => Boolean, :default => false

  validates :name, :presence => true, :length => { :minimum => 2 }

  def self.top_categories
    self.where(:ancestry => nil)
  end

  def format_name
    self.name.downcase.gsub(/\s/,'_')
  end

  def self.match_formatted_name(formatted_name)
    self.where(:name => /#{formatted_name.split('_').first}/i).first
  end
end
