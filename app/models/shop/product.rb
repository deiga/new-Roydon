class Shop::Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include ActiveModel::ForbiddenAttributesProtection
  include Shop::Caching

  paginates_per 9

  before_validation { self.image.clear if self.delete_image == '1' }
  before_save :normalize_filename

  has_and_belongs_to_many :categories, class_name: 'Shop::Category'
  has_and_belongs_to_many :options, class_name: 'Shop::Option', inverse_of: nil
  has_and_belongs_to_many :group_discounts, class_name: 'Shop::GroupDiscount'
  belongs_to :discount, class_name: 'Shop::Discount'
  belongs_to :value_added_tax, class_name: 'Shop::ValueAddedTax'

  attr_accessor :image, :delete_image
  attr_reader :image_remote_url

  has_mongoid_attached_file :image,
  styles: {
    thumb: ['175x', :png],
    show: ['400x', :png]
  }

  field :name,        :type => String
  field :price,       :type => Money, default: Money.new(0)
  field :passive,     :type => Boolean,     :default => false
  field :suggestion,  :type => Boolean,     :default => false
  field :description, :type => String

  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "Only amounts in the range 0 to 10000.00 are allowed."  }

  scope :active, where(passive: false)
  scope :category_products, lambda { |category| where(:category_ids.in => (category.children << category)).asc('name').active.includes(:options) }

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # image_file_name == "face.png"
    # image_content_type == "image/png"
    @image_remote_url = url_value
  end

  def self.search term
    where(name: /#{term}/).includes(:options)
  end

  def discounted_price
    discount.present? ? price * discount.subtract_percentage : price
  end

  private
    def normalize_filename
      if image.exists?
        image_file_name = image_file_name.parameterize.downcase unless image_file_name.blank?
      end
    end

end
