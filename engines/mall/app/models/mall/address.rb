module Mall
  class Address
    include Mongoid::Document
    include Mongoid::Timestamps

    belongs_to :user, inverse_of: :addresses, touch: true
    belongs_to :order, class_name: 'Order', inverse_of: :address

    before_save :set_name

    field :name, type: String

    field :street, type: String
    field :postal_number, type: String
    field :city, type: String
    field :country, type: String

    field :phone_number, type: String
    field :description, type: String
    field :home, type: Boolean, default: true

    validates :street, presence: true, length: { minimum: 4}
    validates :postal_number, length: { is: 5}
    validates :phone_number, format: { with: /\A((([\+][\s]{0,1})|([0]{2}[\s-]{0,1}))([358]{3})([\s-]{0,1})|([0]{1}))(([1-9]{1}[0-9]{0,1})([\s-]{0,1})([0-9]{2,4})([\s-]{0,1})([0-9]{2,4})([\s-]{0,1}))([0-9]{0,3}){1}\z/}

    private
    def set_name
      if name.blank?
        self.name = street
      end
    end
  end
end
