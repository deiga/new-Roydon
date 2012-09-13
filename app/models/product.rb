class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  paginates_per 9

  before_save :normalize_filename

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :options

  attr_accessible :image
  attr_reader :image_remote_url

  has_mongoid_attached_file :image,
  styles: {
    thumb: ['175x', :png],
    show: ['330x250', :png]
  }

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  field :name,        :type => String
  field :price,       :type => BigDecimal,  :default => 0.0
  field :passive,     :type => Boolean,     :default => false
  field :suggestion,  :type => Boolean,     :default => false
  field :description, :type => String

  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0}

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # image_file_name == "face.png"
    # image_content_type == "image/png"
    @image_remote_url = url_value
  end

  private
    def normalize_filename
      if self.image.exists?
        self.image_file_name= self.image_file_name.parameterize.downcase
      end
    end

end
