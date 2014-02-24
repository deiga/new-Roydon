class Shop::Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry
  include ActiveModel::ForbiddenAttributesProtection
  extend Shop::Caching

  before_validation :generate_permalink

  has_ancestry
  has_and_belongs_to_many :products, class_name: 'Shop::Product'

  field :name, :type => String, default: ''
  field :passive, :type => Boolean, :default => false
  field :permalink, :type => String

  index permalink: 1

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :permalink, uniqueness: true

  scope :active, -> { where(passive: false) }
  scope :with_products, -> { includes(:products) }
  scope :top_categories, -> { where(ancestry: nil) }

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

  def products_cache_key
    Digest::MD5.hexdigest "#{Shop::Product.category_products(self).max(:updated_at)}.try(:to_i)-#{Shop::Product.category_products(self).count}"
  end

  rails_admin do
    configure :ancestry, :enum do
      label 'Parent'
      enum do
        Shop::Category.where(:id.ne => bindings[:object].id).map { |c| [c.name, c.id]}
      end
    end
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at, :products
    end
    edit do
      field :name
      field :ancestry
      field :products
      field :passive
      exclude_fields :permalink
    end
  end

  private

    def generate_permalink
      if self.changes.has_key? 'name' || self.permalink.blank?
        self.permalink = self.name.parameterize
      end
    end
end
