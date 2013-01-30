class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  field :street, type: String
  field :postal_number, type: String
  field :city, type: String
  field :country, type: String

  field :telephone, type: String
  field :description, type: String
  field :home, type: Boolean, default: true
end
