# encoding: UTF-8
class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  before_save :generate_permalink

  has_ancestry
  has_and_belongs_to_many :products

  field :name, :type => String
  field :passive, :type => Boolean, :default => false
  field :permalink, :type => String

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :permalink, uniqueness: true

  def self.top_category_ids
    self.where(:ancestry => nil).map(&:id).map(&:to_s)
  end


  def format_name
    self.name.downcase.gsub(/\s/,'_')
  end

  def self.find_by_formatted_name(formatted_name)
    self.where(:name => /#{formatted_name.split('_').first}/i).first
  end

  def all_products
    self.children.reduce(self.products) do |list, child|
      list << child.products
    end
  end

  def to_param
    if self.ancestry.nil?
      permalink
    else
      self.ancestors.first.permalink+'-'+permalink
    end
  end

  private

    def generate_permalink
      if self.permalink.nil?
        self.permalink = self.name.parameterize.downcase
      end
    end
end
