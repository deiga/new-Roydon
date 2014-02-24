class Shop::Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include ActiveModel::ForbiddenAttributesProtection
  extend Shop::Caching

  paginates_per 9

  before_validation { self.image.clear if self.delete_image == '1' }

  has_and_belongs_to_many :categories, class_name: 'Shop::Category'
  has_and_belongs_to_many :options, class_name: 'Shop::Option', inverse_of: nil
  has_and_belongs_to_many :group_discounts, class_name: 'Shop::GroupDiscount'
  belongs_to :discount, class_name: 'Shop::Discount'
  belongs_to :value_added_tax, class_name: 'Shop::ValueAddedTax'

  attr_accessor :image, :delete_image
  attr_accessor :image_url

  before_save :download_remote_image, if: :image_url_present?
  before_save :normalize_filename

  has_mongoid_attached_file :image,
  styles: {
    thumb: ['175x', :png],
    show: ['400x', :png]
  }

  field :name,        type: String
  field :price,       type: Money,    default: Money.new(0)
  field :passive,     type: Boolean,  default: false
  field :suggestion,  type: Boolean,  default: false
  field :description, type: String

  validates :name, presence: true, length: { minimum: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000, message: 'Only amounts in the range 0 to 10000.00 are allowed.'  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :active, -> { where(passive: false) }
  scope :category_products, ->(category) { where(:category_ids.in => (category.children << category)).asc('name').active.includes(:options) }

  def self.search(term)
    where(name: /#{term}/).includes(:options)
  end

  def discounted_price
    discount.present? ? price * discount.subtract_percentage : price
  end

  rails_admin do
    configure :price, :decimal do
      pretty_value do
        humanized_money value + ' €'
      end
    end
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
    edit do
      field :name, :string
      field :price do
        help 'Example: 35,00'
      end
      field :description, :wysihtml5
      field :image, :paperclip
      field :passive
      field :suggestion
      field :categories
      field :options
      field :value_added_tax
    end
  end

  private

    def image_url_present?
      image_url.present?
    end

    def download_remote_image
      self.image = URI.parse(image_url)
    end

    def normalize_filename
      if image.exists?
        extension = File.extname(image_file_name).downcase
        self.image.instance_write(:file_name, "#{image_file_name.parameterize.downcase}#{extension}") unless image_file_name.blank?
      end
    end
end
