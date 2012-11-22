class Shop::Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  after_create :clear_cache
  after_update :clear_cache
  before_destroy :clear_cache
  before_validation :generate_permalink

  has_ancestry
  has_and_belongs_to_many :products, class_name: 'Shop::Product'

  field :name, :type => String, default: ''
  field :passive, :type => Boolean, :default => false
  field :permalink, :type => String

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :permalink, uniqueness: true

  scope :active, where(passive: false)

  def self.top_categories
    self.where(:ancestry => nil)
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
      self.ancestors.first.permalink+'~'+permalink
    end
  end

  def top_category?
    self.ancestry.nil?
  end

  private

    def generate_permalink
      if self.permalink.nil?
        self.permalink = self.name.parameterize.downcase
      end
    end

    def clear_cache
      ActionController::Base.new.expire_fragment(:shop_navigation)
    end
end
