class Shop::Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry
  include ActiveModel::ForbiddenAttributesProtection

  before_validation :generate_permalink

  has_ancestry
  has_and_belongs_to_many :products, class_name: 'Shop::Product'

  field :name, :type => String, default: ''
  field :passive, :type => Boolean, :default => false
  field :permalink, :type => String

  index permalink: 1

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :permalink, uniqueness: true

  scope :active, where(passive: false)
  scope :with_products, includes(:products)
  scope :top_categories, lambda { where(ancestry: nil) }

  def all_products
    Shop::Product.category_products(self)
  end

  def to_param
    if top_category?
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
      if self.changes.has_key? 'name' || self.permalink.blank?
        self.permalink = self.name.parameterize
      end
    end
end
